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
  coupons.each do |coupon|
    current_item = coupon[:item]
    coupon_code = current_item + " W/COUPON"
    if cart[current_item] && cart[current_item][:count] >= coupon[:num]
      if cart[coupon_code]
        cart[coupon_code][:count] += 1 
      else 
        cart[coupon_code] = {
          count: 1,
          price: coupon[:cost],
          clearance: cart[current_item][:clearance]
        }
      end
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