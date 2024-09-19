number_of_bags = input("How many number of bags do you want to purchase from this grossary stores? ")
discout_per_bag = 0.2
price_per_each_bag = 100
total_discount = discout_per_bag * float(number_of_bags) *float(price_per_each_bag)
print("The total discount in the grocessery store is ", total_discount)
total_amount = float(number_of_bags) * price_per_each_bag
purchase_price = total_amount - total_discount
print("The purchase amount for the bag is ",purchase_price)