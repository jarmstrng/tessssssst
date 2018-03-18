require 'invoice_builder'

class CartApplication
  def self.display_cart(cart)
    invoicer = InvoiceBuilder.new
    error = invoicer.validate_qty(cart[0])

    line_items = invoicer.build_full_line_items(cart)
    total = invoicer.total(cart)

    if error
      puts error
    else
      puts cart_output(line_items, total)
    end
  end

  private

  def self.cart_output(line_items, total)
    "Your cart:

" + line_items_string(line_items) +
"---
Total $" + cents_for_output(total)
  end

  def self.line_items_string(line_items)
    string = ""
    line_items.each do |item|
      string += "#{item[:quantity]} copy of \"#{item[:product_name]}\" for $#{cents_for_output(item[:original_price])}\n"
    end

    string
  end

  def self.cents_for_output(price_cents)
    '%.2f' % (price_cents / 100)
  end
end
