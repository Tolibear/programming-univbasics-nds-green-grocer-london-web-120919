require 'pry'

def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length do
    return collection[i] if collection[i][:item] == name
    i +=1
  end
end

def consolidate_cart(cart)
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  unique_cart = cart.uniq

  index = 0
    while index < unique_cart.length do
      this_item_name = unique_cart[index][:item]

      cart_index = 0
      item_count = 0
        while cart_index < cart.length do
          item_count +=1 if cart[cart_index][:item] == this_item_name
          cart_index += 1
        end

      unique_cart[index][:count] = item_count
      index += 1
    end
  unique_cart
end


def apply_coupons(cart, coupons)
  # binding.pry
  # REMEMBER: This method **should** update cart
  coupons_with_names = {}
  coupon_i = 0
    while coupon_i < coupons.length do
      coupons_with_names[coupons[coupon_i][:item]] = coupons[coupon_i]
      coupon_i += 1
    end

  i = 0

    while i < cart.length do
      if cart[i][:clearance]
        item_on_sale = cart[i][:item]
        item_frequency = cart[i][:count]
        coupon_frequency = coupons_with_names[item_on_sale][:num]
        enough_items = item_frequency >= coupon_frequency
        non_discounted_items = item_frequency % coupon_frequency

        items_with_discount_frequency = if !enough_items
          0
          elsif enough_items && non_discounted_items == 0
            item_frequency / coupon_frequency
          else
            (item_frequency - non_discounted_items) / item_frequency
          end

        item_with_discount_name = "#{item_on_sale} W/COUPON"
        item_with_discount_price = coupons_with_names[item_on_sale][:num] / coupons_with_names[item_on_sale][:cost]

        item_with_discount_hash = {:item => item_with_discount_name, :price => item_with_discount_price, :clearance = true, :count => items_with_discount_frequency}
        cart << item_with_discount_hash if items_with_discount_frequency != 0

        cart[i][:count] = non_discounted_items
      end
      i+=1
    end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
