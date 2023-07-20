# frozen_string_literal: true

# parking module
module Parking2
  # inherit parking2 module
  class Park2
    def display_task_options
      puts "\nSelect the following task option:"
      puts '1 - Create Slot'
      puts '2 - Add vehicle'
      puts '3 - Remove vehicle'
      puts '4 - View slots'
      puts "0 - Quit the parking area !\n\n"
    end

    def print_details(index)
      p "#{index + 1} - #{@slots[index].user_name} - #{@slots[index].mobile_number}
       - #{@slots[index].lisence_number} - #{@slots[index].email}"
    end

    def bring_name_and_vehicle_number
      puts 'Enter the vehicle user name:'
      user_name = bring_verified_name
      puts 'Enter the vehicle number:'
      vehicle_number = bring_verified_vehicle_number
      [user_name, vehicle_number]
    end

    def bring_lisence_and_mobile_number
      puts 'Enter the vehicle lisence number:'
      lisence_number = bring_verified_lisence_number
      puts 'Enter the user mobile number:'
      mobile_number = bring_verified_mobile_number
      [lisence_number, mobile_number]
    end

    def bring_email
      puts 'Enter your email:'
      bring_verified_email
    end

    def bring_verified_email
      loop do
        input = gets.chomp
        is_valid = input.end_with?('@gmail.com')
        puts 'Email should be in the format "xyz@gmail.com"' unless is_valid
        return input if is_valid
      end
    end

    def print_mod_slot(obj, index)
      id = index + 1
      name = obj.user_name
      mobile = obj.mobile_number
      lisence = obj.lisence_number
      email = obj.email
      puts "#{id} - #{name} - #{mobile} - #{lisence} - #{email}"
    end

    def check_are_chars(str)
      str.length.times do |i|
        return false unless str[i].match(/\d/)
      end
      true
    end
  end
end
