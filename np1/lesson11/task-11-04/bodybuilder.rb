class Bodybuilder

  def initialize
    @biceps = 0
    @triceps = 0
    @delta = 0
  end

  def grow_up(type)
    if type == "biceps"
      @biceps += 1
    elsif type == "triceps"
      @triceps += 1
    elsif type == "delta"
      @delta += 1
    end
  end

  def status
    puts "Бицепсы: #{@biceps}"
    puts "Трицепсы: #{@triceps}"
    puts "Дельтовидка: #{@delta}"
  end

end