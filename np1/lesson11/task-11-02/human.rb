# encoding: utf-8

class Human

  def initialize(name, middle_name)
    @name = name
    @middle_name = middle_name
  end

  def fullname
    return @name + " " + @middle_name
  end

end