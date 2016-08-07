require 'pry'
class LunchLady
  attr_accessor :main_menu_items, :counter, :side_dish
  def initialize
    @main_menu_items = [['Meatloaf', 5.00], ['Mystery Meat', 3.00], ['Slop', 1.00]]
    @counter = 1
    @side_dish = [['Carrots', 1.75], ['Mystery Yogert', 1.00], ['Beef Jerkey', 0.50]]
    @side_dish_choice_int = []
    @side_dish_cost = []
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
      side_dish_menu
    else
      puts "** Invalid Main Dish choice! Please try again. **"
      main_dish
    end
  end

  def side_dish_menu
    puts "How many side dishes do you want?"
    number_to_add = gets.to_i
    added = 0
    number_to_add.times do
      puts "Which is your side dish choice?"
      @side_dish.each do |el|
        puts "#{counter}: #{el[0]}(#{el[1]})"
        @counter += 1
      end
      @counter = 1
      prompt
      user_input = gets.to_i
      if @arr.include? user_input
        @side_dish_choice_int << @side_dish[user_input - 1][0]
        @side_dish_cost << @side_dish[user_input - 1][1]
        added += 1
      else
        puts "** Invalid Side Dish choice! Please try again. **"
      end
    end
    if added == 0
      puts "You did not select any side dishes."
      side_dish_menu
    else
      summary
    end
  end

  def summary
    main_dish_sum = @main_menu_items[@main_dish_choice_int_1 - 1][0]
    main_dish_cost = @main_menu_items[@main_dish_choice_int_1 - 1][1]
    puts "Your order consists of:"
    puts "#{main_dish_sum}, #{@side_dish_choice_int.join(", ")}"
    puts "Your order total is #{main_dish_cost + @side_dish_cost.reduce(0, :+)}"
  end

end

lunch_lady = LunchLady.new

lunch_lady.main_dish
