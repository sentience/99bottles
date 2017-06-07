# 99 Bottles of OOP
class Bottles
  def verse(num_bottles)
    <<-VERSE
#{count(num_bottles)} of beer on the wall, #{count(num_bottles)} of beer.
Take one down and pass it around, #{count(num_bottles - 1)} of beer on the wall.
VERSE
  end

  def count(num_bottles)
    if num_bottles > 1
      "#{num_bottles} bottles"
    else
      "#{num_bottles} bottle"
    end
  end
end
