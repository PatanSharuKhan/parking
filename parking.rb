# frozen_string_literal: true

require './vehicle'
require './parking_methods'

# Parking method module with classes parking and vehicle
module Methods
  # parking class
  class Parking
    def initialize
      @slots = []
      @slots_count = 0
      @vehicles_count = 0
      @empty_slots_count = 0
    end

    def run
      loop do
        Methods.display_task_options
        user_option = gets.chomp.to_i
        user_option.zero? ? break : activate_selected_option(user_option)
      end
    end

    def activate_selected_option(option)
      case option
      when 1 then add_slot
      when 2 then add_user_vehicle_data
      when 3 then display_and_remove_vehicle
      when 4
        display_slots
        display_parking_details
      else puts 'Invalid option ! Enter the valid option !'
      end
    end

    def add_slot
      @slots << 0
      @slots_count += 1
      @empty_slots_count += 1
      puts "\nNew slot is created!\n\n"
    end

    def add_user_vehicle_data
      puts 'Enter the vehicle user name:'
      user_name = gets.chomp
      puts 'Enter the vehicle number:'
      vehicle_number = gets.chomp
      puts 'Enter the vehicle lisence number:'
      lisence_number = gets.chomp
      puts 'Enter the user mobile number:'
      mobile_number = gets.chomp
      vehicle = Vehicles::Vehicle.new(user_name, vehicle_number, lisence_number, mobile_number)
      add_vehicle(vehicle.vehicle_object)
    end

    def add_vehicle(vehicle_object)
      @slots.length.times do |slot|
        next if @slots[slot] != 0

        @slots[slot] = vehicle_object
        update_count_success_view
        return ''
      end
      add_slot
      @slots[-1] = vehicle_object
      update_count_success_view
    end

    def update_count_success_view
      @vehicles_count += 1
      @empty_slots_count -= 1
      puts "----------------vehicle added successfully------------------ \n\n"
    end

    def display_and_remove_vehicle
      if @slots.length.positive?
        display_vehicles
        slot_id = gets.chomp.to_i
        remove_vehicle(slot_id)
      else
        puts "\nVehicles Not Found!\n\n"
      end
    end

    def display_vehicles
      puts '---id - name---'
      @slots.length.times do |i|
        puts "#{i} - #{@slots[i]}" if @slots[i] != 0
      end
    end

    def remove_vehicle(slot_id)
      @slots.length.times do |i|
        if slot_id != i then next
        elsif @slots[i] == Hash then modify_slot(i)
                                     return ''
        elsif @slots[i].zero? then puts "The slot you selected is not having vehicle \n"
                                   return ''
        end
      end
      puts "Entered invalid slot id ! \n"
    end

    def modify_slot(index)
      @slots[index] = 0
      @vehicles_count -= 1
      puts "Vehicle removed!\n\n"
    end

    def display_slots
      puts "\nSlots view - #{@slots}"
    end

    def display_parking_details
      puts "\nTotal slots - #{@slots_count}"
      puts "Vehicles count - #{@vehicles_count}"
      puts "Empty slots count - #{@empty_slots_count}\n\n"
    end
  end
end
