# 99 Bottles of OOP
class Bottles
  def verse(num_bottles)
    phrases = phrases(num_bottles)
    count = phrases.count
    consume_action, remaining_bottles = phrases.consume
    remaining_phrases = phrases(remaining_bottles)

    <<-VERSE
#{count.capitalize} of beer on the wall, #{count} of beer.
#{consume_action}, #{remaining_phrases.count} of beer on the wall.
VERSE
  end

  private

  def phrases(num_bottles)
    counter, consumer = if num_bottles == 0
                          [Count::Zero.new, Consume::Zero.new]
                        elsif num_bottles == 1
                          [Count::One.new, Consume::One.new]
                        else
                          [Count::Many.new, Consume::Many.new]
                        end

    Phrases.new(num_bottles: num_bottles, counter: counter, consumer: consumer)
  end
end

class Phrases
  attr_reader :num_bottles, :counter, :consumer

  def initialize(num_bottles:, counter:, consumer:)
    @num_bottles = num_bottles
    @counter = counter
    @consumer = consumer
  end

  def count
    counter.count(num_bottles)
  end

  def consume
    [consumer.action(num_bottles), consumer.remaining(num_bottles)]
  end
end

module Count
  class Zero
    def count(_num_bottles)
      'no more bottles'
    end
  end

  class One
    def count(num_bottles)
      "#{num_bottles} bottle"
    end
  end

  class Many
    def count(num_bottles)
      "#{num_bottles} bottles"
    end
  end
end

module Consume
  class Zero
    def action(_num_bottles)
      'Go to the store and buy some more'
    end

    def remaining(_num_bottles)
      99
    end
  end

  class One
    def action(_num_bottles)
      'Take it down and pass it around'
    end

    def remaining(num_bottles)
      num_bottles - 1
    end
  end

  class Many
    def action(_num_bottles)
      'Take one down and pass it around'
    end

    def remaining(num_bottles)
      num_bottles - 1
    end
  end
end
