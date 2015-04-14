class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
  	quantity * product.price.to_f
  end

  # deletes the product if quantity = 0
  # else decrements the product quantity by 1
  def decrement_quantity
    if quantity >= 1
      update_attributes(quantity: quantity-1)
      return quantity
    else
      destroy
      return 0
    end
  end
end
