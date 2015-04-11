class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

    # adds a product to the cart if not already present
    # if already present, bumps up the quantity
    def add_product(product_id)
    	current_item = line_items.find_by(product_id: product_id)
    	if current_item
    		current_item.quantity += 1
    	else
    		current_item = line_items.build(product_id: product_id)
    	end
    	current_item
    end

    def total_price
      line_items.collect{|line_item| line_item.total_price}.sum
      line_items.to_a.sum { |line_item| line_item.total_price }
    end
end
