# Стратегия - поведенческий паттерн, позволяет одним запросом получать
# от объекта различный результат в зависимости от 
# текущей стратегии(внешних обстоятельств). Стратегия в данном случае
# это отдельный класс, который присваивается аттрибуту объекта 
# либо при его инициализации либо в процессе работы. 

class Gun
  attr_reader :color, :damage
  attr_accessor :bullet

  def initialize(bullet)
    @color = 'orange'
    @damage = 350
    @bullet = bullet
  end

  def destroy_target
    bullet.destroy_target(self)
  end
end

class FireBullet
  def destroy_target(context)
    "Taget was burnt with #{context.damage} damage #{context.color} gun!"
  end
end

class ColdBullet
  def destroy_target(context)
    "Taget was freezed with #{context.damage} damage #{context.color} gun!"
  end
end

p gun = Gun.new(FireBullet.new)
p gun.destroy_target
p gun.bullet = ColdBullet.new
p gun.destroy_target