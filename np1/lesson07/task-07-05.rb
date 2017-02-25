# encoding: utf-8

# Использование готового решения

# Подключение внешней библиотеки
#require 'securerandom'

# Токен
#token = SecureRandom.hex(4)

#puts token



# Самостоятельное решение

# Массив значений для генерации токена
values = ("a".."z").to_a + (0..9).to_a

# Длина строки токена
length = 8

# Счетчик для перебора
count = 1

# Содержимое токена
token = ""

while count <= length do
  # Формирование токена
  token += values.sample.to_s

  count +=1
end

puts token