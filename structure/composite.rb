# Компоновщик (Composite) - компонует объекты в древовидную структура,
# позволяя одинково обращаться как к простому объекту так и
# к целому поддереву. Реализуется двумя классами - 
# Compoment, от которого наследуются простые объекты, и
# Composite, от которого наследуются объекты содержащие дочерние объекты. 
# При этом Соmposite является подклассом Compoment, расширяя его функциональность.


class OrcComponent
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def power
    30
  end
end

class OrcComposite < OrcComponent
  attr_accessor :components

  def initialize(name)
    super(name)
    @components = []
  end

  def <<(component)
    @components << component
    component.parent = self
  end

  def power
    @components.inject(0) { |total, orc| total += orc.power }
  end
end

class Orc < OrcComponent ; end
class OrcHorde < OrcComposite ; end
class OrcLegion < OrcComposite ; end

orc1 = Orc.new('Bill')
orc2 = Orc.new('Fred')
orc3 = Orc.new('Lora')
p "Power of one orc: #{orc1.power}"
horde = OrcHorde.new('We Orc Horde')
horde << orc1 ; horde << orc2 ; horde << orc3
p "Power of horde: #{horde.power}"
legion = OrcLegion.new('My name is Legion')
legion << horde
legion << orc3
p "Power of legion: #{legion.power}"
p "First orc in: #{orc1.parent.name}"
p "Horde in: #{horde.parent.name}"