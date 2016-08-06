require 'pry'
class LunchLady
  attr_accessor :main_menu_items, :counter, :side_dish
  def initialize
    @main_menu_items = [['Meatloaf', 5.00], ['Mystery Meat', 3.00], ['Slop', 1.00]]
    @counter = 1
    @side_dish = [['Carrots', 1.75], ['Mystery Yogert', 1.00], ['Beef Jerkey', 0.50]]
  end

  def prompt
    print "-->"
  end

  def main_dish
    puts "What main dish would you like?"
    @main_menu_items.each do |el|
      puts "#{counter}: #{el[0]}(#{el[1]})"
      @counter += 1
    end
    @counter = 1
    prompt
    user_input = gets.to_i
    @arr = [1, 2, 3]
    if @arr.include? user_input
      @main_dish_choice_int_1 = user_input
      side_dish_menu_1
    else
      puts "** Invalid Main Dish choice! Please try again. **"
      main_dish
    end
  end

  def side_dish_menu_1
    puts "You get two side dishes."
    puts "Which is you first side dish choice?"
    @side_dish.each do |el|
      puts "#{counter}: #{el[0]}(#{el[1]})"
      @counter += 1
    end
    @counter = 1
    prompt
    user_input = gets.to_i
    if @arr.include? user_input
      @side_dish_choice_int_1_1 = user_input
      side_dish_menu_2
    else
      puts "** Invalid Side Dish choice! Please try again. **"
      side_dish_menu_1
    end
  end

  def side_dish_menu_2
    puts "Which is your second side dish choice?"
    @side_dish.each do |el|
      puts "#{counter}: #{el[0]}(#{el[1]})"
      @counter += 1
    end
    @counter = 1
    prompt
    user_input = gets.to_i
    if @arr.include? user_input
      @side_dish_choice_int_2_1 = user_input
      summary
    else
      puts "** Invalid Side Dish choice! Please try again. **"
      side_dish_menu_2
    end
  end

  def summary
    main_dish_sum = @main_menu_items[@main_dish_choice_int_1 - 1][0]
    main_dish_cost = @main_menu_items[@main_dish_choice_int_1 - 1][1]
    side_dish_1_sum = @side_dish[@side_dish_choice_int_1_1 - 1][0]
    side_dish_1_cost = @side_dish[@side_dish_choice_int_1_1 - 1][1]
    side_dish_2_sum = @side_dish[@side_dish_choice_int_2_1 - 1][0]
    side_dish_2_cost = @side_dish[@side_dish_choice_int_2_1 - 1][1]
    puts "Your order consists of:"
    puts "#{main_dish_sum}, #{side_dish_1_sum}, and #{side_dish_2_sum}"
    puts "Your order total is #{main_dish_cost + side_dish_1_cost + side_dish_2_cost}"
  end

end

lunch_lady = LunchLady.new

lunch_lady.main_dish
