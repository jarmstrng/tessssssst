class Printer
  def display(error, line_items, total)
    if error # TODO: do i even want to handle it this way? (no)
      puts error
    else
      puts cart_output(line_items, total)
    end
  end

  private

  def cart_output(line_items, total)
    "Your cart:

" + line_items_string(line_items) +
"---
Total $" + cents_for_output(total)
  end

  def line_items_string(line_items)
    string = ""
    line_items.each do |item|
      string += "#{item[:quantity]} copy of \"#{item[:product_name]}\" for $#{cents_for_output(item[:original_price])}\n"
    end

    string
  end

  def cents_for_output(price_cents)
    '%.2f' % (price_cents / 100)
  end
end
