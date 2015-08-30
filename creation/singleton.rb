# Синглтон (Singleton) - гарантирует, что класс имеет только один экземпляр
# и предоставляет глобальную точку доступа к нему.

require 'singleton'

class Sun
  include Singleton
  
  def burn
    'BBHHHHHRRRRR'
  end
end

p sun1 = Sun.instance
p sun2 = Sun.instance
# p sun3 = Sun.new - raise error, but Sun.send(:new) don't
p sun1 == sun2