product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

describe InvoiceBuilder do
  context "with bad quantity" do
    it "returns an error" do
      qty = 0
      cart = Order.new([LineItem.new(product_database[1], qty)])
      output = "We're sorry, something went wrong. Please check your order and try again."

      expect(STDOUT).to receive(:puts).with(output)
      CartApplication.display_cart(cart)
    end
  end
end
