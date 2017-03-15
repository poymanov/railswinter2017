# encoding: utf-8

passangers_info = {
  "1" => {
    "number" => "РМ2010398 050298",
    "route" => "Москва -> Петушки",
    "passenger" => "Венедикт В. Ерофеев",
    "passport" => "45 99 505281"
  },
  "2" => {
    "number" => "РМ2010399 050298",
    "route" => "Павловский Посад -> Орехово-Зуево",
    "passenger" => "Иннокентий П. Шниперсон",
    "passport" => "46 01 192872"
  },
  "3" => {
    "number" => "РМ2010399 050298",
    "route" => "Москва -> Владимир",
    "passenger" => "Иван В. Бунша",
    "passport" => "47 33 912876"
  }
}

puts "Пассажиры поезда Москва — Петушки"
puts

passangers_info.each_pair do | key, value |
  puts "* * * Место № #{key} * * *"
  puts "Билет № #{value["number"]}"
  puts "Маршрут: #{value["route"]}"
  puts "Пассажир: #{value["passenger"]}"
  puts "Паспорт: #{value["passport"]}"
  puts
end