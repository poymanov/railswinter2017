class Clothing
  attr_reader :type, :name

  def initialize(file_path)
    data = File.readlines(file_path, :encoding => "UTF-8")

    @name = data[0].chomp
    @type = data[1].chomp

    temperature_data = temperature_from_string(data[2])

    @temperature_from = temperature_data[0].to_i
    @temperature_to = temperature_data[1].to_i
  end

  # Диапазон температуры
  def temperature_from_string(string)
    string.delete("(").delete(")").split(", ")
  end

  # Соответствие погоде
  def available_for_temperature?(temperature)
    temperature.between?(@temperature_from, @temperature_to)
  end

  # Представление для вывода
  def info
    "#{@name}, #{@type}, #{@temperature_from}..#{@temperature_to}"
  end
end