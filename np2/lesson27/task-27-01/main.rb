# encoding: utf-8

require_relative "lib/parent"
require_relative "lib/child"

user_choice = nil

peoples = []

until user_choice == 3
  puts
  puts "Кого создать?"
  puts "1 - Родителя"
  puts "2 - Ребенка"
  puts "3 - Никого"

  user_choice = STDIN.gets.to_i

  if user_choice == 3
    next
  end

  puts
  puts "Как зовут?"
  name = STDIN.gets.chomp

  puts
  puts "Пол?"
  sex = STDIN.gets.chomp

  if user_choice == 1
    classname = Parent
  else
    user_choice == 2
    classname = Child
  end

  peoples << classname.new(name, sex)

end

peoples.each do |person|

  obidience_label = case person.sex
                      when "m" then
                        "послушный"
                      when "f" then
                        "послушная"
                      else
                        "послушное"
                    end

  puts "#{person.name} #{obidience_label}: #{person.obidience_status}"
end

