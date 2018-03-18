require 'invoice_builder'
require 'printer'

class CartApplication
  def self.display_cart(cart)
    invoicer = InvoiceBuilder.new

    line_items = invoicer.build_full_line_items(cart)
    total = invoicer.total(cart)

    printer = Printer.new
    printer.display(line_items, total)
  end
end
