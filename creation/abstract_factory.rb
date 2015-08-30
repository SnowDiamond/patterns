# Абстрактная фабрика (Abstract Factory) - предназначена для создания родственных или схожих объектов без явного определения их класса. Имеет сходство с паттерном strategy. В отличии от фабричного метода, инициализированный объект абстрактной фабрики способен генерировать объекты разных классов. Из минусов сложно добавлять объекты новых классов. 

# Переписанный пример фабричного метода

class Magic
  attr_reader :released_desires

  def initialize(factory)
    @released_desires = []
    @factory = factory
  end

  def release_car(number)
    number.times { @released_desires << @factory.create_car }  
    
  end

  def release_yacht(number)
    number.times { @released_desires << @factory.create_yacht }  
  end

  def release_house(number)
    number.times { @released_desires << @factory.create_house }  
  end
end

class SpellFactory
  def create_car
    Car.new
  end

  def create_yacht
    Yacht.new
  end

  def create_house
    House.new
  end
end

class Car ; end
class Yacht ; end
class House ; end

magic = Magic.new(SpellFactory.new)
magic.release_car(2)
magic.release_yacht(1)
p magic.released_desires