require 'product'
require 'invoice'
require 'order'
require 'line_item'

product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

describe Invoice do
  context "total_cost" do
    it "returns the correct total" do
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 1)])
      invoice = Invoice.new(cart)

      expect(invoice.total).to eq(35_00)
    end

    it "returns the correct total for line items with quantity >1" do
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 2)])
      invoice = Invoice.new(cart)

      expect(invoice.total).to eq(50_00)
    end
  end

  context "build_line_items" do
    it "returns full line items" do
      cart = Order.new([LineItem.new(product_database[1], 1), LineItem.new(product_database[2], 2)])
      invoice = Invoice.new(cart)
      expected_items = [
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

      expect(invoice.full_line_items).to eq(expected_items)
    end

    context "with item having quantity of zero" do
      it "does not include zero-quantity items" do
        cart = Order.new([LineItem.new(product_database[1], 0), LineItem.new(product_database[2], 2)])
        invoice = Invoice.new(cart)
        expected_items = [
            {
              product_name: "Freedom Is a Constant Struggle",
              quantity: 2,
              original_price: 15_00
            }
          ]

        expect(invoice.full_line_items).to eq(expected_items)
      end
    end
  end
end
