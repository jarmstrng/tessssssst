#rename this to Invoice??

class InvoiceBuilder
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
      if item.quantity > 0
        full_item = {
          product_name: item.product_id.name,
          quantity: item.quantity,
          original_price: item.product_id.price_cents
        }
        full_line_items << full_item
      end
    end

    full_line_items
  end
end
