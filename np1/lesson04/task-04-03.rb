# encoding: utf-8

# Исходное число
param = 987298

# Проверка на четность
if (param.even? == true)
  puts param.to_s + " четное число"
else
  puts param.to_s + " нечетное число"
end