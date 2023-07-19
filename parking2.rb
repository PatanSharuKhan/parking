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

    def print_details
      p "#{i + 1} - #{@slots[i].user_name} - #{@slots[i].mobile_number} - #{@slots[i].lisence_number}"
    end
  end
end