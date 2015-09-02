# Адаптер (Adapter) - конвертирует интерфейс класса
# в интерфейс ожидаемый клиентом. Реализуется созданием
# "обвертки" над конвертируемым классом. 


class EntityAdapter
  
  def initialize(entity, energy)
    @entity = entity
    @entity.energy = energy  
  end

  def life_power
    @entity.generate_energy
  end

end

class HibribEntity
  attr_accessor :energy

  def generate_energy
    energy.to_i * 7 
  end
end

class Entity
  attr_accessor :energy

  def initialize(energy)
    @energy = energy
  end

  def life_power
    energy / 2 * 1.5
  end
end

class Avatar
  attr_accessor :entities
  attr_reader :energy

  def initialize(name)
    @energy = 0
    @entities = []
  end

  def connect(entity)
    entities << entity
    @energy += entity.life_power
  end
  # Other complex code  
end

avatar = Avatar.new('Sara')
simple_entity = Entity.new(500)
avatar.connect(simple_entity)
puts "Energy after first connect: #{avatar.energy}" 
entity = EntityAdapter.new(HibribEntity.new, 70)
avatar.connect(entity)
puts "Energy after second connect: #{avatar.energy}" 