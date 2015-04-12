require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products
	def new_product(image_url)
		Product.new(title: "Lorem Ipsum",
								description: "Dolor Amet",
								price: 12,
								image_url: image_url
							)
	end

	test "product attributes should not be empty" do
		@product = Product.new
		assert @product.invalid?
		assert @product.errors[:title].any?
		assert @product.errors[:description].any?
		assert @product.errors[:price].any?
		assert @product.errors[:image_url].any?
	end

	test "product price must be positive" do
		product = Product.new(	title: "Lorem Ipsum",
														description: "Dolor Amet",
														image_url: 'one.jpg')
		product.price = 0.001
		assert_not product.valid?
		assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

		product.price = 1
		assert product.valid?
	end

	test "image url ends with jpg" do
		product = Product.new(	title: "Lorem Ipsum",
														description: "Dolor Amet",
														price: 222
													)
		product.image_url = "xyz"
		assert product.invalid?
		assert  "URL must be a GIF, JPG or PNG image", product.errors[:image_url]

		product.image_url = "https://www.google.com/superman.jpg"
		assert product.valid?
		
		product.image_url = "https://www.google.com/superman.png"
		assert product.valid?

		product.image_url = "https://www.google.com/superman.gif"
		assert product.valid?

		product.image_url = "https://www.google.com/superman.svg"
		assert product.invalid?
		assert "URL must be a GIF, JPG or PNG image", product.errors[:image_url]
	end

	test "image_url must be a gif, jpg or png" do
		ok = %w{ one.jpg two.png three.gif four.Jpg five.Png Six.GiF http://goo.gl/Sev.jpG }
		bad = %w{ bad_one.doc bad_two.srt bad_three.pdf bad_four.asus }
		
		ok.each do |image|
			assert new_product(image).valid?, "#{image} should be valid"
		end

		bad.each do |image|
			product = new_product(image)
			assert product.invalid?, "#{image} shouldn't be valid"
			assert "URL must be a GIF, JPG or PNG image", product.errors[:image_url]
		end

	end

	test "product is not valid without a unique title" do
		product = Product.new(	title: products(:ruby).title,
														description: "Dolor Amet",
														price: 22.22,
														image_url: "superman.jpg"
			)
		assert product.invalid?
		assert ["has already been taken"], product.errors[:title]
	end

	test "product is not valid without a unique title - i18n" do
		product = Product.new(  title: products(:ruby).title,
			                      description: "Lorem Ipsum",
			                      price: 22.22,
			                      image_url: "one.jpg"
													)
		assert product.invalid?
		assert [I18n.translate('errors.messages.taken')], product.errors[:title]
	end

	test "add unique products" do
		product_first = Product.new(  title: products(:ruby).title,
			                      description: "Lorem Ipsum",
			                      price: 22.22,
			                      image_url: "one.jpg")
		assert_no_difference 'Product.count' do
			product_second = Product.new(  title: products(:ruby).title,
				                      description: "Lorem Ipsum",
				                      price: 22.22,
				                      image_url: "one.jpg")
		end
	end

end