# encoding: utf-8

current_path = File.dirname(__FILE__)

# Пути к файлам
paths = [
  current_path + "/data/forehead.txt",
  current_path + "/data/eyes.txt",
  current_path + "/data/nose.txt",
  current_path + "/data/mouth.txt"
]

elements = []

for path in paths
  unless File.exist?(path)
    abort "Не найден файл #{path}. Генерация прекращена."
  end

  # Формирование элементов
  file = File.new(path, "r:UTF-8")
  lines = file.readlines
  file.close

  elements << lines
end

# Вывод изображения
elements.each do |element|
  puts element.sample
end