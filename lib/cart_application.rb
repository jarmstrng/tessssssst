require 'invoice'
require 'printer'

class CartApplication
  def self.display_cart(cart)
    invoice = Invoice.new(cart)
    printer = Printer.new

    printer.display(invoice)
  end
end
