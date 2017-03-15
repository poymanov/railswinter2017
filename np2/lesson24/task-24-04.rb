# encoding: utf-8

variable = 1

class MyClass
  def initialize
    @variable = 2
  end

  def check_variables
    puts "Переменная variable #{defined?(variable)}"
    puts "Переменная @variable #{defined?(@variable)}"
  end
end

my_class = MyClass.new
my_class.check_variables

puts "Переменная variable #{defined?(variable)}"
puts "Переменная @variable #{defined?(@variable)}"

