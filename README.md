## How to run

Assuming you already have ruby & bundler installed, in the terminal run the following commands:

1. `git@github.com:jarmstrng/tessssssst.git`
1. `cd tessssssst/`
1. `bundle install`
1. `rspec`

## Thoughts

I chose Ruby for this code challenge because, while I am more experienced with React, my limited experience in setting up new React projects with ES6 and testing libraries has demonstrated that it can be a hairy experience, and I didn't want to spend all my time just setting up the project. I assumed you all were more interested in seeing code than config files!

I started with TDD(ish)-ing a naive solution that was then challenging to add discounting functionality to, so I stashed the discount work and spent a lot of time refactoring. Once I figured out how to think about the work from a MVC perspective it was easier to reason about.

It was tempting to spend much more than 4 hours on this, but in the interest of work-life balance I tried to design it so that discounting would be easy to add later ("for each desired change, make the change easy (warning: this may be hard), then make the easy change" - [Kent Beck](https://twitter.com/KentBeck/status/250733358307500032)).

I deleted some little TDD-induced tests that weren't adding value anymore because they were covered by other tests (stuff like "it displays something") and am mildly horrified by how few tests there are, but there is so little logic that I hesitate to add more; adding discounting functionality will of course up the number of tests significantly (see below for an initial list of cases I'd like to cover).

I chose to add an Invoice class and the concept of a `full_line_item` because a former client tech lead who had spent a lot of time in ecommerce convinced me that it is a good idea to know exactly what a customer saw when they placed the order. It currently feels like a bit of a grab bag of functionality, but as new features are added I think it can be split up into sensible chunks.

## TODO

Add RuboCop, and maybe Codecov

Make product database hash a separate file to be included where necessary (or... use a real DB)

Display formatting
- copy vs copies for line items with >1 quantity
- for line items with >1 quantity, is displayed price the price paid for one of that item, or for the item multiplied by the quantity?? (this is further complicated by adding discounts)

Apply discounts
- in Invoice, build line items with additional key: "discounted price"
- pass full_line_items and discount to total_cost instead of the cart
- if discounting requires a lot of logic, consider creating a separate module for performing calculations
- display both original price and discounted price to user

Need to ensure:
 :all discount type applies discount to all products (assumption based on example)
 :product_ids discount type applies discount only to products in list
 - does not apply to product not in list
 - applies to one product in list
 - applies to multiple products in list

Test for:
 - :all discount
 - :product_ids discount with no applicable products
 - :product_ids discount with one applicable product and one not-applicable product
 - :product_ids discount with two different applicable products
 - :product_ids discount with two applicable & 1 not-applicable?
