# encoding: utf-8

class Chameleon

  def initialize
    @color = nil
  end

  def change_color(color)
    @color = color
    puts "Теперь я #{color}!"
  end

end