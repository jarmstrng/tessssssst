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
      total_in_cents += item.product_id.price_cents
    end

    total_in_cents
  end
end
