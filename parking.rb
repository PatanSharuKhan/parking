# frozen_string_literal: true

require './vehicle'

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
        display_task_options
        user_option = gets.chomp.to_i
        break if user_option.zero?

        activate_selected_option user_option
      end
    end

    def display_task_options
      puts "\n\nSelect the following task option:"
      puts '1 - Create Slot'
      puts '2 - Add vehicle'
      puts '3 - Remove vehicle'
      puts '4 - View slots'
      puts "0 - Quit the parking area ! \n \n"
    end

    def activate_selected_option(option)
      case option
      when 1
        add_slot
      when 2
        add_user_vehicle_data
      when 3
        display_and_remove_vehicle
      when 4
        display_slots
        display_parking_details
      else
        puts 'Invalid option ! Enter the valid option !'
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
      vehicle = Vehicles::Vehicle.new(user_name, vehicle_number, lisence_number)
      add_vehicle(vehicle.vehicle_object)
    end

    def add_vehicle(vehicle_object)
      @slots.length.times do |slot|
        next unless (@slots[slot]).zero?

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
      error_msg = "\nfor removing vehicle, enter respective serial numbers:\n\n"
      if @slots.length.positive?
        puts error_msg
        display_vehicles
        slot_id = gets.chomp.to_i
        remove_vehicle(slot_id)
      else
        puts "\nVehicles Not Found!\n\n"
      end
    end

    def display_vehicles
      (0...@slots.length).each do |i|
        puts "#{i} - #{@slots[i]}"
      end
    end

    def remove_vehicle(slot_id)
      @slots.length.times do |i|
        next if slot_id != i

        if @slots[i].instance_of?(Vehicles::Vehicle) # is instance of vehicle class ?
          @slots[i] = 0
          @vehicles_count -= 1
          puts "Vehicle removed!\n\n"
          return ''
        end
        if (@slots[i]).zero?
          puts "The slot you selected is not having vehicle \n"
          return ''
        end
      end
      puts "Entered invalid slot id ! \n"
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
