class Film
  attr_reader :film, :director, :year

  def initialize(path)
    file = File.new(path, "r:UTF-8")
    file_data = file.readlines

    @film = file_data[0].chomp
    @director = file_data[1].chomp
    @year = file_data[2].chomp
  end

  def info
    "#{@director} - #{@film} (#{@year})"
  end
end