require 'cart_application'
require 'order'
require 'line_item'
require 'product'
require 'invoice'

product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

describe CartApplication do
  context "display_cart" do
    it "displays formatted order with total" do
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 2)])
      output = "Your cart:

1 copy of \"Black Jacobins\" for $20.00
2 copy of \"Freedom Is a Constant Struggle\" for $15.00
---
Total $50.00"

      expect(STDOUT).to receive(:puts).with(output)
      CartApplication.display_cart(cart)
    end
  end
end
