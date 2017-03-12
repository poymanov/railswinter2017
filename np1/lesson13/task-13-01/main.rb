# encoding: utf-8

path = ARGV[0]

if path == nil
  abort "Не указан путь к файлу"
end

current_path = File.dirname(__FILE__)

filepath = current_path + "/" + path

if !File.exist?(filepath)
  abort "Файл не найден"
end

file = File.new(filepath, "r:UTF-8")

lines = file.readlines
file.close

# Получение пустых строк

empty_lines = 0

for line in lines
  if line.chomp.empty?
    empty_lines += 1
  end
end

puts "Открыли файл: #{path}"
puts "Всего строк: #{lines.size}"
puts "Пустых строк: #{empty_lines}"
puts
puts "Последние 5 строк файла: "
puts lines.last(5)