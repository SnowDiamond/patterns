# Наблюдатель (Observer) - поведенческий паттерн, определяет зависимость типа «один ко многим» между объектами таким образом, что при изменении состояния одного объекта все зависящие от него оповещаются об этом событии.

# Можно использовать встроенный модуль в ruby:
# require 'observer' - подключаем библиотеку
# include Observable - подмешиваем модуль наблюдаемый класс
# changed - в необходимый метод наблюдаемого класса вместе с notivy_observers 


module Observer
  attr_reader :observers

  def initialize(attr = {})
    @observers = []  
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_observers
    @observers.each { |observer| observer.update }
  end
end

class Women
  include Observer
  attr_reader :name, :pretty

  def initialize(attr = {})
    super # no need if use ruby observer
    @name = attr[:name]
    @pretty = attr[:pretty] || false   
  end

  def go_to_shopping
    # changed - if user ruby observer
    notify_observers
  end
end

class Boyfriend
  attr_reader :money

  def initialize
    @money = 1000
    @in_love = false
  end

  def meet_women(women)
    @in_love = true if women.pretty
    women.add_observer(self) if self.in_love?
  end

  def in_love?
    @in_love
  end

  def reduce_money(amount)
    @money -= amount
  end

  def update
    reduce_money(rand 500)
  end
end

p boy_friend1 = Boyfriend.new
p boy_friend2 = Boyfriend.new
p not_pretty_women = Women.new(name: 'Nice')
p women = Women.new(name: 'Sweet', pretty: true)
boy_friend1.meet_women(women)
#boy_friend2.meet_women(women)
#boy_friend1.meet_women(not_pretty_women)
boy_friend2.meet_women(not_pretty_women)
women.go_to_shopping
not_pretty_women.go_to_shopping
p boy_friend1.money
p boy_friend2.money