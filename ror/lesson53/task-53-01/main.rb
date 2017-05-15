# encoding: utf-8

require 'pony'

require 'io/console'

my_mail = "regsregs@yandex.ru"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо? Введите адрес:"
send_to = STDIN.gets.chomp

puts "Тема сообщения?"
subject = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.encode("UTF-8").chomp

Pony.mail(
  subject: subject, # тема письма
  body: body, # текст письма, его тело
  to: send_to, # кому отправить письмо
  from: my_mail, # от кого письмо (наш обратный адрес)

  via: :smtp,
  via_options: {
    address: 'smtp.yandex.ru',
    port: '465',
    enable_starttls_auto: true,
    tls: true,
    user_name: my_mail,
    password: password,
    authentication: :plain,
  }
)

puts "Письмо отправлено!"
