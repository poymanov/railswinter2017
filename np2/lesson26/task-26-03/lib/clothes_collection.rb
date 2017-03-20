class ClothesCollection
  attr_reader :clothes, :types

  def initialize(path)
    unless Dir.exist?(path)
      abort "Не найден каталог с одеждой"
    end

    @path = path
    @clothes = []
    @types = []

    clothes_from_dir
    types
  end

  # Получение одежды
  def clothes_from_dir
    @clothes = []

    Dir[@path + '/*.txt'].each do | file_path |
      clothing = Clothing.new(file_path)
      @clothes << clothing
    end
  end

  # Типы вещей
  def types
    @clothes.each do | item |
      unless @types.include?(item.type)
        @types << item.type
      end
    end

    @types
  end

  # Вещи по типу
  def clothes_by_type(type)
    clothes = @clothes.select do | item |
      item.type == type
    end
  end

end