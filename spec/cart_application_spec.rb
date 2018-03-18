require 'cart_application'
require 'order'
require 'line_item'
require 'product'
require 'invoice_builder'

product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

describe CartApplication do
  context "display_cart" do
    it "displays order" do
      qty = 1
      cart = Order.new([LineItem.new(product_database[1], qty)])
      output = "Your cart:

1 copy of \"Black Jacobins\" for $20.00
---
Total $20.00"

      expect(STDOUT).to receive(:puts).with(output)
      CartApplication.display_cart(cart)
    end

    it "displays multiple line items" do
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 2)])
      output = "Your cart:

1 copy of \"Black Jacobins\" for $20.00
2 copy of \"Freedom Is a Constant Struggle\" for $15.00
---
Total $50.00"

      expect(STDOUT).to receive(:puts).with(output)
      CartApplication.display_cart(cart)
    end

    it "displays correct quantity" do
      qty = 2
      cart = Order.new([LineItem.new(product_database[1], qty)])
      output = "Your cart:

2 copy of \"Black Jacobins\" for $20.00
---
Total $40.00"

      expect(STDOUT).to receive(:puts).with(output)
      CartApplication.display_cart(cart)
    end
  end
end









# displays stuff
# has correct total

# :all applies discount to all products (assumption based on example)
# :product_ids applies discount only to products in list
# - does not apply to product not in list
# - applies to one product in list
# - applies to multiple products in list

# order with
# - no discount
# - :all discount
# - :product_ids discount and no applicable products
# - :product_ids discount and one applicable product and one not-applicable product
# - :product_ids discount and two different applicable products
# - :product_ids discound and two applicable & 1 not-applicable?

# handle quantities (incl 0)
# dollars_in_cents

# differences in input/arguments

# copy vs copies?

# output formatter

# cart_application_spec requires wayyyy too many other things
