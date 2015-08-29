# Шаблонный метод (Template method) - 
# определяет АЛГОРИТМ, некоторые этапы которого делегируются подклассам.
# Позволяет подклассам переопределить эти этапы, не меняя структуру алгоритма. 
# Участиники: 1. Абстрактный класс - определяет скелет алгоритма;
# 2. Конкретный класс - реализует специфические шаги, переопределяя
# методы абстрактного класса.

class SportCar
  attr_reader :max_speed, :horses

  def initialize
    @max_speed = set_max_speed
    @horses = set_horses
  end

  def set_max_speed
    200
  end

  def set_horses
    300
  end

  def greeting
    message = ['Hi man!']
    message << concrete_message
    message.join(' ')
  end

  def concrete_message
    raise 'You must defaine concrete_message!'
  end
end

class Porshe < SportCar
  def concrete_message
    "I'm winner!"
  end

  def set_max_speed
    450
  end
end

class Bmw < SportCar
  def concrete_message
    "Lets start!"
  end
end

p porshe = Porshe.new
p porshe.greeting
p bmw = Bmw.new
p bmw.greeting
