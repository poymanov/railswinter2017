# encoding: utf-8

current_path = File.dirname(__FILE__)

begin
  # Получаем файл шаблона
  template_file = File.new(current_path + '/data/template.html', 'r:UTF-8')
  template = template_file.read
  template_file.close
rescue
  abort "Ошибка открытия файла"
end

# Получение данных от пользователя

puts "Введитее имя и фамилию:"
name = STDIN.gets.chomp

puts "Введите должность:"
position = STDIN.gets.chomp

puts "Введите url фотографии:"
image = STDIN.gets.chomp

puts "Введите телефон:"
tel = STDIN.gets.chomp

puts "Введите email:"
email = STDIN.gets.chomp

# Добавляем значения в шаблон
template = template.sub('{image}', image)
template = template.sub('{name}', name)
template = template.sub('{position}', position)
template = template.sub('{tel}', tel)
template = template.sub('{email}', email)

# Сохраняем файл

time = Time.now

file_name = time.strftime("%Y-%m-%d_%H-%M") + ".html"
file_path = current_path + "/output/"

begin
  file = File.new(file_path + file_name, "a:UTF-8")
  file.puts(template)
  file.close
  puts "Ваша визитка сохранена в файл #{file_path + file_name}"
rescue
  abort "Ошибка сохранения файла"
end