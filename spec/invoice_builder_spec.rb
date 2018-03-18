product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

describe InvoiceBuilder do
  context "with bad quantity" do
    it "returns an error" do
      invoicer = InvoiceBuilder.new
      qty = 0
      line_items = [LineItem.new(product_database[1], qty)]
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
  end
end
