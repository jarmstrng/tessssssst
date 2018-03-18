#rename this to Invoice??

class InvoiceBuilder

  def initialize
  end

  def validate_qty(line_items)
    error = nil
    line_items.each do |item|
      error_string = "We're sorry, something went wrong. Please check your order and try again."
      error = item.quantity > 0 ? nil : error_string
    end

    @error = error
  end
end
