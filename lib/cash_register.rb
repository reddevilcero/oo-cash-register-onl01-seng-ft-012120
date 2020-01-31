require 'pry'

class CashRegister
  attr_accessor :total ,:discount, :items
  def initialize(discount=0)
    self.discount = discount
    self.total = 0
    self.items = []
  end
  def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times { self.items << item }
    @last = [item, price, quantity]
  end
  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total -= self.total * self.discount/100
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
      last_transaction_import = @last[1] * @last[2]
      self.total-= last_transaction_import
      @last[2].times{self.items.pop}

  end



end
