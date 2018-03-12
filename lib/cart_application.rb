require 'product'

product_database = {
  1 => Product.new("Black Jacobins", 20_00),
  2 => Product.new("Freedom Is a Constant Struggle", 15_00)
}

class CartApplication
  def self.display_cart(cart)
    error = validate_qty(cart)

    if error
      puts error
    else
      puts "Your cart:

" + line_items_string(cart) +
"---
Total $" + total(cart)
    end
  end

  def self.validate_qty(cart)
    error = nil
    cart[0].each do |item|
      error_string = "We're sorry, something went wrong. Please check your order and try again."
      error = item.quantity > 0 ? nil : error_string
    end

    error
  end

  def self.line_items_string(cart)
    string = ""
    cart[0].each do |item|
      string += "#{item.quantity} copy of \"#{item.product_id.name}\" for $#{cents_for_output(item.product_id.price_cents)}\n"
      # this item.product_id.name feels really funky
    end

    string
  end

  def self.cents_for_output(price_cents)
    '%.2f' % (price_cents / 100)
  end

  def self.total(cart)
    total_in_cents = 0
    cart[0].each do |item|
      total_in_cents += item.product_id.price_cents
    end

    cents_for_output(total_in_cents)
  end
end
