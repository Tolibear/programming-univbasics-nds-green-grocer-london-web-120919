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
      item_name = unique_cart[index][:item]
      items = [] 
      items << find_item_by_name_in_collection(item_name, cart)

      unique_cart[index][:count] = items.count(item_name)
      index += 1
  #     old_cart_index = 0
  #       while old_cart_index < cart.length do
  #         item_count +=1 if cart[old_cart_index][:item] == item_name
  #         old_cart_index += 1
  #       end
  #     consolidated_cart[:count] = item_count
  #     new_cart_index +=1
    end
  unique_cart
  # binding.pry
end


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
