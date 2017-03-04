class Human

  def initialize(name, second_name, age)
    @name = name
    @second_name = second_name
    @age = age
  end

  def fullname
    if is_old?
      return @name + " " + @second_name
    else
      return @name
    end

  end

  def is_old?
    return @age > 60
  end

  def age
    string = "И ему #{@age} - "

    if is_old?
      string += "пожилой"
    else
      string += "молодой"
    end

    return string
  end

end