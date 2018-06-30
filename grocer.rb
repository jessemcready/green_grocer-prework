def consolidate_cart(cart)
  # code here
  consolidated_cart = {}
  cart.each do |item|
    item.each do |key, value|
      count = cart.count(item)
      consolidated_cart[key] = {}
      value.each do |extra, extra_value|
        consolidated_cart[key][extra] = extra_value
      end 
      consolidated_cart[key][:count] = count
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  # code here
  # traverse our list of coupons 
  coupons.each do |coupon|
    # keep track of our current coupon's item name 
    current_item = coupon[:item]
    coupon_code = current_item + " W/COUPON"
    # if our cart has the item and has enough of the item to use a coupon 
    if cart[current_item] && cart[current_item][:count] >= coupon[:num]
      # check if we have our <item> W/COUPON in our cart already 
      if cart[coupon_code]
        # if we do increment the count 
        cart[coupon_code][:count] += 1 
      # if we don't have the coupon we will add it to the cart 
      else 
        cart[coupon_code] = {
          count: 1,
          price: coupon[:cost],
          clearance: cart[current_item][:clearance]
        }
      end
      # after we add the coupon to the cart, reduce the count by the number of items needed for the coupon 
      cart[current_item][:count] -= coupon[:num]
    end 
  end
  cart
end 

def apply_clearance(cart)
  # code here
  cart.each do |item, options|
    cart_item = cart[item]
    puts cart_item[:clearance]
    if cart_item[:clearance] == true
      cart_item[:price] = (cart_item[:price]  * 20) / 100
    end
  end 
  cart
end

def checkout(cart, coupons)
  # code here
end