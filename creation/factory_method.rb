# Фабричный метод (Factory Method) - делегирует инициализирование
# объектов разных классов своим подклассам либо сам решает какого
# класса объект необходимо инициализировать принимая агрумент
# (параметризированный фабричный метод). При инициализации объектов
# возможно создать более одного объекта. Фабричный метод стороиться
# на наследовании, похож на template method. В отличии от abstract
# factory не предназначен для создания смешанных объектов, т.е
# фабричный объект инициализируется уже с предопределенной способностью
# генерировать объекты того или иного класса.

# Пример параметризированного FM

class Magic
  attr_reader :released_desires

  def initialize(number, desire)
    @released_desires = []
    number.times { @released_desires << release(desire) }  
  end

end

class SpellFactory < Magic
  def release(desire)
    if [:car, :yacht, :house].include?(desire)
      Class.const_get(desire.to_s.capitalize).new
    else
      raise "Unknown desire! Go away!"
    end
  end
end

class Car ; end
class Yacht ; end
class House ; end

spell = SpellFactory.new(5, :yacht)
p spell.released_desires
