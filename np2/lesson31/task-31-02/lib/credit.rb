class Credit
  attr_reader :rating

  def initialize(age, sex, income, history, amount)
    @age = age
    @sex = sex
    @income = income
    @history = history
    @amount = amount
    @rating = nil

    calculate
  end

  # Подсчет рейтинга
  def calculate
    if @rating != nil
      return
    end

    @rating = 0

    if @age.between?(21, 40)
      @rating += 10
    elsif @age > 40
      @rating += 20
    end

    if @sex == 2
      @rating += 10
    end

    if @income.between?(20001, 40000)
      @rating += 10
    elsif @income > 40000
      @rating += 20
    end

    if @history == 1
      @rating += 20
    end

    if @amount.between?(20001, 40000)
      @rating += 10
    elsif @amount < 20000
      @rating += 20
    end
  end

  # Доступность кредита
  def approve?
    return @rating >= 50
  end
end