require 'product'
require 'invoice_builder'
require 'order'
require 'line_item'

product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

describe InvoiceBuilder do
  # TODO: do i even want to handle it this way?
  # maybe if quantity is zero, just remove it from line items or don't display it
  context "with zero quantity" do
    it "returns an error" do
      invoicer = InvoiceBuilder.new
      line_items = [LineItem.new(product_database[1], 1), LineItem.new(product_database[1], 0)]
      error = "We're sorry, something went wrong. Please check your order and try again."

      expect(invoicer.validate_qty(line_items)).to eq(error)
    end
  end

  context "order with no discounts" do
    it "returns the correct total" do
      invoicer = InvoiceBuilder.new
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 1)])

      expect(invoicer.total(cart)).to eq(35_00)
    end

    it "returns the correct total for line items with quantity >1" do
      invoicer = InvoiceBuilder.new
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 2)])

      expect(invoicer.total(cart)).to eq(50_00)
    end
  end

  context "build_line_items" do
    it "returns full line items" do
      invoicer = InvoiceBuilder.new
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 2)])
      expected_items =         [
          {
            product_name: "Black Jacobins",
            quantity: 1,
            original_price: 20_00
          },
          {
            product_name: "Freedom Is a Constant Struggle",
            quantity: 2,
            original_price: 15_00
          }
        ]

      expect(invoicer.build_full_line_items(cart)).to eq(expected_items)
    end
  end
end
