# encoding: utf-8

def happy_birthday(person)
  puts "Дорогой #{person[:name]},"
  puts
  puts "Поздравляем Вас с днём рождения!"
  puts "Вам сегодня исполняется аж #{person[:age]}!"
  puts
  puts person[:text]
end

person_info = {
  name: "Борис",
  age: "48",
  text: "Желаем успехов в лечении простатита!"
}

happy_birthday(person_info)