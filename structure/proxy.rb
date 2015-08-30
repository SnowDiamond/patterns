# Прокси (Proxy) - предоставляет замену реального объекта 
# для контроля доступа к нему. 

require 'forwardable'

class DeathStarProxy
  extend Forwardable

  def_delegators :real_object, :speed, :color

  def initialize(capitan)
    @capitan = capitan
  end

  def fire
    raise 'You have no permission!' unless @capitan.name == 'Dart Weider'
    real_object.fire
  end

  def real_object
    @real_object || (@real_object = DeathStar.new)
  end
  
end
  
class DeathStar
  attr_accessor :speed, :color

  def initialize
    @speed = 100000
    @color = :dark
  end

  def fire
    "!*!*!*!*!*!*!*!*!*!"
  end
end

class Capitan
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

capitan = Capitan.new('Dart Weider')
death_star = DeathStarProxy.new(capitan)
puts death_star.color
puts death_star.fire
#yoda = Capitan.new('Yoda')
#death_star = DeathStarProxy.new(yoda)
#death_star.fire