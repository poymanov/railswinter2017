# encoding: utf-8

# Получаем текущее время
time = Time.now

# Получаем текущее время суток
hours = time.hour

# Время пробуждения персонажа зависит от текущего времени суток

if (hours <= 7)
  puts "Вы проснулись рано утром"
elsif (hours > 7 && hours <= 12)
  puts "Вы проснулись утром"
elsif (hours > 12 && hours <= 15)
  puts "Вы проснулись в обеденное время"
elsif (hours > 15 && hours <= 18)
  puts "Вы проснулись во второй половине дня"
elsif (hours > 18 && hours <= 21)
  puts "Вы проснулись вечером"
elsif (hours > 21)
  puts "Вы проснулись поздно вечером"  
end

# Секретный чит
cheat = 999

choice = nil

# Проверка введенного значения на допустимость
until choice == 1 || choice == 2 || choice == 3 || choice == cheat do
  # Сеттинг
  puts "Чем хотите заняться в свой выходной день?"
  puts "1. Порешать задачи для RailsWinter2017"
  puts "2. Пойти в кино"
  puts "3. Дальше лечь спать"

  # Выбор пользователя
  choice = gets.to_i
end

# "3. Дальше лечь спать"
if (choice == 3)
  puts "Вы легли спать. А зачем просыпались то тогда?"
elsif (choice == 2)
  # "2. Пойти в кино"

  choice = nil

  # Проверка введенного значения на допустимость
  until choice == 1 || choice == 2 || choice == 3 do
    puts "Вы слишком быстро собрались и даже не успели почитать отзывы на КиноПоиск.ру"
    puts "Теперь придется выбирать фильм на угад:"
    puts "1. Фильм 1"
    puts "2. Фильм 2"
    puts "3. Фильм 3"

    choice = gets.to_i
  end

  if (choice == 2)
    puts "\"Поздравляем\"! Вас занесло на \"На пятьдесят оттенков темнее\"."
    puts "Ваша жизнь уже никогда не будет прежней."
    puts "Прощайте."
    exit
  else
    puts "Вы выбрали хороший фильм"
    puts "Поздравляем! Хорошее настроение на весь остаток дня вам обеспечено!"
    exit
  end
elsif (choice == 1)
  # "1. Порешать задачи для RailsWinter2017"
  
  choice = nil

  until choice == 1 || choice == 2 do
    puts "Прошло 2 часа, а вы никак не можете сдвинуться с места " \
    "и постоянно отвлекаетесь. Что будете делать?"
    puts "1. Бросить занятия и расслабиться"
    puts "2. Пересмотреть видеоурок, погуглить, задать вопрос коллегам"

    choice = gets.to_i    
  end

  if (choice == 1)
    abort "Боимся, что програмирование это не ваше. Прощайте."
  else
    abort "Так держать, у вас все получится! Мы в вас верим!"
  end
elsif (choice == 999)
  # Секретный чит
  abort "Поздравляем! Вам не нужно ничего выбирать, чему-то учиться и развиваться! " \
  "Вы супер успешный человек с постоянным пассивным доходом!"
end