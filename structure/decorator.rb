# Декоратор (Decorator) - динамически предоставляет объекту дополнительные 
# возможности и представляет из себя гибкую альтернативу наследованию 
# для расширение функциональности.

require 'forwardable' # Вместо method_missing

class HumanDecorator  
  extend Forwardable # Расширяем методы класса

  def_delegators :@human, :alive?, :power=, :abilities

  def initialize(human)
    @human = human
  end
end

class MystiqueHumanDecorator < HumanDecorator
  def abilities
    @human.abilities << "transform into another human"
  end

  def power
    @human.power += 200  
  end
end

class WolverineHumanDecorator < HumanDecorator
  def abilities
    @human.abilities << "show metalic clutches"
  end

  def power
    @human.power += 300  
  end

  def scare_people
    puts "||| |||"
  end
end

class Human
  attr_accessor :power, :abilities

  def initialize
    @power = 100
    @abilities = [:speak, :run]
  end

  def abilities
    @abilities.join(', ')
  end

  def alive?
    true
  end

end

human = Human.new
wolverine_human = WolverineHumanDecorator.new(Human.new) 
mystique_human = MystiqueHumanDecorator.new(Human.new)
super_human = MystiqueHumanDecorator.new(WolverineHumanDecorator.new(human))
puts "Human has power of #{human.power} and can #{human.abilities}."
puts "Wolverine has power of #{wolverine_human.power} and can #{wolverine_human.abilities}."
puts "Super-Human has power of #{super_human.power} and can #{super_human.abilities}."

#puts mystique_human.alive?
#puts wolverine_human.scare_people