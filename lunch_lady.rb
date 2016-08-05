require 'pry'
class LunchLady
  attr_accessor :main_menu_items, :counter, :side_dish
  def initialize
    @main_menu_items = [{'Meatloaf'=> 5.00, 'Mystery Meat'=> 3.00, 'Slop'=> 1.00}]
    @counter = 1
    @side_dish = [{'Carrots'=> 1.75, 'Mystery Yogert'=> 1.00, 'Beef Jerkey'=> 0.50}]
  end
  
  def prompt
    print "-->"
  end

  def main_dish
    puts "What main dish would you like?"
    @main_menu_items.each do |el|
      el.each do |key, value|
        puts "#{counter}: #{key}(#{value})"
        @counter += 1
      end
      @counter = 1
    end
    prompt
    user_input = gets.to_i
    if user_input == 1
      @main_dish_choice1 = user_input
      side_dish_menu_1
    elsif user_input == 2
      @main_dish_choice2 = user_input
      side_dish_menu_1
    elsif user_input == 3
      @main_dish_choice3 = user_input
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
      el.each do |key, value|
        puts "#{counter}: #{key}(#{value})"
        @counter += 1
      end
      @counter = 1
    end
    prompt
    user_input = gets.to_i
    if user_input == 1
      @side_dish_choice1_1 = user_input
      side_dish_menu_2
    elsif user_input == 2
      @side_dish_choice1_2 = user_input
      side_dish_menu_2
    elsif user_input == 3
      @side_dish_choice1_3 = user_input
      side_dish_menu_2
    else
      puts "** Invalid Main Dish choice! Please try again. **"
      side_dish_menu_1
    end
  end

  def side_dish_menu_2
    puts "Which is your second side dish choice?"
    @side_dish.each do |el|
      el.each do |key, value|
        puts "#{counter}: #{key}(#{value})"
        @counter += 1
      end
      @counter = 1
    end
    prompt
    user_input = gets.to_i
    if user_input == 1
      @side_dish_choice1 = user_input
      #summary
    elsif user_input == 2
      @side_dish_choice2 = user_input
      #summary
    elsif user_input == 3
      @side_dish_choice3 = user_input
      #summary
    else
      puts "** Invalid Main Dish choice! Please try again. **"
      side_dish_menu_2
    end
  end

end

lunch_lady = LunchLady.new

lunch_lady.main_dish
