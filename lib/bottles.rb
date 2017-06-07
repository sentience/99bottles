# 99 Bottles of OOP
class Bottles
  def verse(num_bottles)
    <<-VERSE
#{num_bottles} bottles of beer on the wall, #{num_bottles} bottles of beer.
Take one down and pass it around, #{num_bottles - 1} bottles of beer on the wall.
VERSE
  end
end
