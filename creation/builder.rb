# Строитель (Builder) - разделяет создание сложного объекта
# и инициалиализацию его состояния так, что одинаковый
# процесс построения может создать объекты с разным состоянием. 

class PlanetarySystemBuilder
  
  def initialize(has_life, bodies_count)
    @planetary_system = PlanetarySystem.new
    @planetary_system.has_life = has_life
    @planetary_system.bodies_count = bodies_count
  end

  def add_planets(number)
    number.times { @planetary_system.planets << Planet.new }
  end

  def add_stars(number)
    number.times { @planetary_system.stars << Star.new }
  end

  def add_commets(number)
    number.times { @planetary_system.commets << Comet.new }
  end

  def planetary_system
    real_count = @planetary_system.planets.size + 
                 @planetary_system.stars.size +
                 @planetary_system.commets.size
    if @planetary_system.bodies_count != real_count
      raise 'Please add correct numbers of bodies!'
    else
      @planetary_system
    end
  end
end

class PlanetarySystem
  attr_accessor :planets, :stars, :commets, :has_life, :bodies_count

  def initialize
    @planets = []
    @stars = []
    @commets = []
  end
end

class Planet ; end
class Star ; end
class Comet ; end

builder = PlanetarySystemBuilder.new(true, 10)
builder.add_planets(6)
builder.add_stars(2)
builder.add_commets(2)
p planetary_system = builder.planetary_system