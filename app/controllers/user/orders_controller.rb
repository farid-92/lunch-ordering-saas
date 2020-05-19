class User::OrdersController < DashboardController
  def index
    @total_sum = 0
    @orders = Order.all.map {|order| sum = order.order_items.map {|item| item.price}.sum; @total_sum += sum
      {order: order,
       list: order.order_items.group_by {|c| c.category}.map {|category, items| {category: category, items: items}},
       sum: sum,
      }
    }
  end
end
