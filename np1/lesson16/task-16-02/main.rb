# encoding: utf-8

current_path = File.dirname(__FILE__)

# Пути к файлам
paths = [
  current_path + "/data/foreheads.txt",
  current_path + "/data/eyes.txt",
  current_path + "/data/noses.txt",
  current_path + "/data/mouths.txt"
]

elements = paths.map {|path|
  unless File.exist?(path)
    abort "Не найден файл #{path}. Генерация прекращена."
  end

  # Формирование элементов
  file = File.readlines(path)
}

time = Time.now

# Имя файла
file_name = "face-" + time.strftime("%Y-%m-%d-%H-%M-%S") + ".txt"
file_path = current_path + "/output/"

file = File.new(file_path + file_name, "a:UTF-8")

# Запись изображения
elements.each do |element|
  file.puts(element.sample)
end

file.close

puts "Сгенировано новое изображение:"
puts file_path + file_name