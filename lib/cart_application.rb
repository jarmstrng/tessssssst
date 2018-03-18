require 'invoice_builder'
require 'printer'

class CartApplication
  def self.display_cart(cart)
    invoicer = InvoiceBuilder.new
    error = invoicer.validate_qty(cart[0])

    line_items = invoicer.build_full_line_items(cart)
    total = invoicer.total(cart)

    printer = Printer.new
    printer.display(error, line_items, total)
  end
end
