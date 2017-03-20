class Parent
  attr_reader :name, :sex
  def initialize(name, sex)
    @name = name
    @sex = sex
  end

  def obidience_status
    true
  end

end