require "pry"
class CashRegister

    attr_accessor :discount, :total, :item_list, :last_quantity, :last_price

    def initialize(employee_discount = 0)
        @total = 0.0
        @discount = employee_discount
        @item_list = []
        @last_quantity = 0
        @last_price = 0.0
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times { self.item_list.push(title) }
        self.last_quantity = quantity
        self.last_price = price
    end

    def apply_discount
        if @discount != 0
            self.total = (100.0 - self.discount) / 100.0 * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        self.item_list
    end

    def void_last_transaction 
        self.last_quantity.times do 
            self.item_list.pop
            self.total -= self.last_price
        end
        
    end


end

binding.pry

