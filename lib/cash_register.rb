class CashRegister
    attr_accessor :total
    attr_reader :discount, :cart
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        self.cart << [title, price, quantity]
    end

    def apply_discount
        return "There is no discount to apply." if self.discount == 0
        self.total -= self.total * self.discount / 100
        return "After the discount, the total comes to $#{self.total}."
    end

    def items
        list = []
        self.cart.each do |i|
            for ctr in 1..i[2]
                list << i[0]
            end
        end
        return list
    end

    def void_last_transaction
        x = self.cart.length - 1
        self.total -= self.cart[x][1] * self.cart[x][2]
        self.cart.pop
    end
end
