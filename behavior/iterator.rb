# Итератор (Iterator) - предоставляет способ последовательного
# доступа к элементам множества, независимо от его внутреннего устройства. Может быть 
# внутренним и внешним. При реализации внутреннего итератора подмешивание Enumerable 
# и определении each и <=> обогащает объект всеми методами модуля Emumerable. 

class Pensieve
  include Enumerable
  attr_reader :memorials

  def initialize
    @memorials = []
  end

  def add_remember(remember)
    @memorials << remember
  end

  def each(&block)
    @memorials.each(&block)
  end
  
end

class Remember
  attr_accessor :emotion

  def initialize(name)
    @name = name
    @emotion = 0
  end

  def <=>(other) # add comparison method
    @emotion <=> other.emotion
  end
end

class PensieveIterator
  attr_accessor :index

  def initialize(pensieve)
    @memorials = pensieve.memorials
    @index = 0
  end

  def has_next?
    @index < @memorials.size
  end

  def next
    remember = @memorials[@index]
    @index += 1
    remember
  end
end

remember1 = Remember.new('Buying car')
remember1.emotion = 20
remember2 = Remember.new('Hack pentagon')
remember2.emotion = 40
pensieve = Pensieve.new
pensieve.add_remember(remember1)
pensieve.add_remember(remember2)
p pensieve.memorials
# Using external interator
iterator = PensieveIterator.new(pensieve)
total_emotion = 0
while iterator.has_next?
  total_emotion += iterator.next.emotion
end
p total_emotion
# Using internal iterator
total_emotion = pensieve.inject(0) { |total, remember| total += remember.emotion }
p total_emotion
p pensieve.max