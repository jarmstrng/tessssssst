#rename this to Invoice??

class InvoiceBuilder
  def validate_qty(line_items)
    error = nil
    line_items.each do |item|
      error_string = "We're sorry, something went wrong. Please check your order and try again."
      error = item.quantity > 0 ? nil : error_string
    end

    error
  end

  def total(cart)
    total_in_cents = 0
    cart[0].each do |item|
      total_in_cents += (item.product_id.price_cents * item.quantity)
    end

    total_in_cents
  end

  def build_full_line_items(cart)
    full_line_items = []
    cart[0].each do |item|
      full_item = {
        product_name: item.product_id.name,
        quantity: item.quantity,
        original_price: item.product_id.price_cents
      }
      full_line_items << full_item
    end

    full_line_items
  end
end
