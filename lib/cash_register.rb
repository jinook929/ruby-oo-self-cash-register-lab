class CashRegister
    attr_accessor :total, :discount, :items_array

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items_array = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        @total += (price * quantity)
        @items_array << {title: title, price: price, quantity: quantity}
    end

    def apply_discount
        @total = @total * (100 - @discount) / 100
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        item_names = []
        @items_array.each {|item|
            tmp = Array.new(item[:quantity], item[:title])
            item_names = item_names.concat(tmp)
        }
        return item_names
    end

    def void_last_transaction
        @total = @total - (@items_array.last[:price] * @items_array.last[:quantity])
        @items_array.pop
    end
end

### Using Splat(`*`) arguments ###
# class CashRegister
#     attr_accessor :total, :discount, :items_array

#     def initialize(*discount)
#         @total = 0
#         @discount = discount[0]
#         @items_array = []
#     end

#     def total
#         @total
#     end

#     def add_item(title, price, *quantity)
#         if !quantity[0]
#             @total = @total + price
#             @items_array << {title: title, price: price, quantity: 1}
#         else
#             @total = @total + (price * quantity[0])
#             items = Array.new(*quantity[0], title)
#             for item in items do
#             @items_array << {title: title, price: price, quantity: quantity[0]}
#             end
#         end
#     end

#     def apply_discount
#         if @discount
#             @total = @total * (100 - @discount) / 100
#             "After the discount, the total comes to $#{@total}."
#         else
#             "There is no discount to apply."
#         end
#     end

#     def items
#         item_names = @items_array.collect {|item|
#             item[:title]
#         }
#         return item_names
#     end

#     def void_last_transaction
#         if @items_array.last[:quantity]
#             @total = @total - @items_array.last[:price] * @items_array.last[:quantity]
#         else
#             @total = @total - @items_array.last[:price]
#         end
#         @items_array.pop
#     end
# end