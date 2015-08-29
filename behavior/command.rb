# Команда (Command) - абстарктный класс, который инкапсулирует в себе
# данные конкретной команды, и выполняет ее при необходимости. 
# Поддерживает отмену выполения команды и повторное выполнение 
# отменной команды. Дополнительно можно создать класс, который 
# будет служить ввиде контейнера для хранения команд в определенной 
# последовательсти и выполнит их в спусковой момент за один раз. 

class BankRobbery
  def initialize(bank)
    @bank = bank
    @steps = []
  end

  def add_step(step)
    step.bank = @bank
    @steps << step
  end

  def execute
    @steps.each(&:execute)
  end

  def unexecute
    @steps.reverse.each(&:unexecute)
  end
end

class Bank
  attr_accessor :alarm, :deposite, :money

  def initialize(name, money)
    @alarm = true
    @deposite = 'closed'
    @money = money
    @name = name
  end
end

class DisableAlarm
  attr_accessor :bank

  def execute
    @bank.alarm = false
  end

  def unexecute
    @bank.alarm = true
  end
end

class OpenDeposite
  attr_accessor :bank

  def execute
    @bank.deposite = 'opened'
  end

  def unexecute
    @bank.deposite = 'closed'
  end
end

class TakeMoney
  attr_accessor :bank, :stolen_money

  def execute
    @stolen_money = @bank.money
    @bank.money = 0
  end

  def unexecute
    @bank.money = @stolen_money
    @stolen_money = 0
  end
end

p bank = Bank.new('Galaxy Bank', 100000)
bank_robbery = BankRobbery.new(bank)
bank_robbery.add_step(DisableAlarm.new)
bank_robbery.add_step(OpenDeposite.new)
bank_robbery.add_step(TakeMoney.new)
bank_robbery.execute
p bank
#bank_robbery.unexecute
#p bank
