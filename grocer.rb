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
  # loop through our coupons 
  coupons.each do |coupon|
    # keep track of our current coupons item name, such as "AVOCADO" or "KALE"
    current_item = coupon[:item]
    coupon_price = coupon[:cost]
    # check to see if our cart has an item that matches our current item 
    if cart[current_item]
      # if it does have our item, we have to see if it has enough of the same item to match our coupon 
      if cart[current_item][:count] >= coupon[:num]
        # if it does have enough items, check to see if our cart already has the coupon item , if it does increment the count
        coupon_name = current_item += " W/COUPON"
        if cart[coupon_name]
            cart[coupon_name][:count] += 1
        else 
          cart[coupon_name] = {
            count: 1,
            price: coupon_price
          }
          cart[coupon_name][:clearance] = cart[current_item][:clearance]
        end
      end
      # after we add the coupon to our cart, we have to rearrange our cart to match the number of items we have being used with a coupon 
        cart[current_item][:count] -= coupon[:num]
    end
  end
  cart
end 

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end