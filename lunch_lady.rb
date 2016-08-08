require 'pry'
class LunchLady
  attr_accessor :main_menu_items, :counter, :side_dish
  def initialize(wallet_amount = 10.0)
    @main_menu_items = [['Meatloaf', 5.00],
                        ['Mystery Meat', 3.00],
                        ['Slop', 1.00]]
    @main_dish_choice_int = []
    @main_dish_cost = []
    @counter = 1
    @side_dish = [['Carrots', 1.75],
                  ['Mystery Yogert', 1.00],
                  ['Beef Jerkey', 0.50]]
    @side_dish_choice_int = []
    @side_dish_cost = []
    @arr = [1, 2, 3]
    @wallet_amount = 10
  end

  def prompt
    print "-->"
  end

  def wallet
    puts "What do you want to your current wallet amount to be?"
    prompt
    @wallet_amount << gets.to_f
  end

  def main_dish
    puts "Enter 'clear' at any time to start over or 'exit' to quit"
    puts "What main dish would you like?"
    @main_menu_items.each do |el|
      puts "#{counter}: #{el[0]}(#{el[1]})"
      @counter += 1
    end
    @counter = 1
    prompt
    user_input = gets.strip.downcase
    if user_input == 'clear'
      puts "Your options have been cleared!"
      main_dish
    elsif user_input == 'exit'
      exit
    else
      user_input_mod = user_input.to_i
    end
    if @arr.include? user_input_mod
      @main_dish_choice_int << @main_menu_items[user_input_mod - 1][0]
      @main_dish_cost << @main_menu_items[user_input_mod - 1][1]
      binding.pry
      current_total = @main_dish_cost.reduce(0, :+)
      if current_total > @wallet_amount
        puts "You do not have enough money for your current selections please start again.\n"
        @main_dish_cost.clear
        @main_dish_choice_int.clear
        main_dish
      else
        side_dish_menu
      end
    else
      puts "** Invalid Main Dish choice! Please try again. **"
      main_dish
    end
  end

  def side_dish_menu
    puts "How many side dishes do you want?"
    puts "Enter 'clear' to start your side dishes over,"
    puts "'back' to go back to the main dish menu,"
    puts "or 'exit' to quit the program."
    prompt
    user_input_1 = gets.strip.downcase
    if user_input_1 == 'clear'
      puts "Your options have been cleared!"
      side_dish_menu
    elsif user_input_1 == 'back'
      @main_dish_cost.clear
      @main_dish_choice_int.clear
      main_dish
    elsif user_input_1 == 'exit'
      exit
    else
      number_to_add = user_input_1.to_i
    end
    added = 0
    number_to_add.times do
      puts "Which is your side dish choice?"
      @side_dish.each do |el|
        puts "#{counter}: #{el[0]}(#{el[1]})"
        @counter += 1
      end
      @counter = 1
      prompt
      user_input = gets.strip.downcase
      if user_input == 'clear'
        puts "Your options have been cleared!"
        @side_dish_choice_int.clear
        @side_dish_cost.clear
        added = 0
        break
        side_dish_menu
      else
        user_input_mod = user_input.to_i
      end
      if @arr.include? user_input_mod
        @side_dish_choice_int << @side_dish[user_input_mod - 1][0]
        @side_dish_cost << @side_dish[user_input_mod - 1][1]
        current_total = @main_dish_cost.reduce(0, :+) + @side_dish_cost.reduce(0, :+)
        if current_total > @wallet_amount
          puts "You do not have enough money for your current selections please start again."
          @main_dish_cost.clear
          @main_dish_choice_int.clear
          @side_dish_choice_int.clear
          @side_dish_cost.clear
          main_dish
        else

        end
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
    puts "Your order consists of:"
    puts "#{@main_dish_choice_int.join(", ")}, #{@side_dish_choice_int.join(", ")}"
    puts "Your order total is #{@main_dish_cost.reduce(0, :+) + @side_dish_cost.reduce(0, :+)}"
    @main_dish_cost.clear
    @main_dish_choice_int.clear
    @side_dish_choice_int.clear
    @side_dish_cost.clear
  end

end

lunch_lady = LunchLady.new




while true
  user_input = lunch_lady.main_dish
  if user_input == 'QUIT'
    puts "Thanks for using your Lunch Lady ordering system. Please come again!"
    exit
  else
    puts
  end
end
