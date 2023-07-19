# frozen_string_literal: true

require './vehicle'
require './parking1'

# Parking method module with classes parking and vehicle
module Parking
  # parking class
  class Park < Parking1::Park1
    def initialize
      super
      @slots = []
      @slots_count = 0
      @vehicles_count = 0
      @empty_slots_count = 0
    end

    def run_app
      loop do
        display_task_options
        user_option = gets.chomp
        user_option == '0' ? break : trigger_selected_option(user_option)
      end
    end

    def trigger_selected_option(option)
      case option
      when '1' then add_slot
      when '2' then add_vehicle_data
      when '3' then display_and_remove_vehicle
      when '4' then display_slots
      else puts 'Invalid option ! Enter the valid option !'
      end
    end

    def add_slot
      @slots << 0
      @slots_count += 1
      @empty_slots_count += 1
      puts "\nSlot is created.\n"
    end

    def add_vehicle_data
      puts 'Enter the vehicle user name:'
      user_name = bring_verified_name
      puts 'Enter the vehicle number:'
      vehicle_number = bring_verified_vehicle_number
      puts 'Enter the vehicle lisence number:'
      lisence_number = bring_verified_lisence_number
      puts 'Enter the user mobile number:'
      mobile_number = bring_verified_mobile_number
      vehicle = Vehicles::Vehicle.new(user_name, vehicle_number, lisence_number, mobile_number)
      add_vehicle(vehicle)
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
        display_vehicles @slots
        remove_vehicle(gets.chomp.to_i - 1)
      else
        puts "\nVehicles Not Found!\n\n"
      end
    end

    def remove_vehicle(slot_id)
      @slots.length.times do |i|
        next if slot_id != i

        if @slots[i] != 0
          modify_slot(i)
          return ''
        else
          puts 'enter the valid slot id!'
        end
      end
      puts "Entered invalid slot id ! \n"
    end

    def modify_slot(index)
      @slots[index] = 0
      @vehicles_count -= 1
      puts "Vehicle removed!\n\n"
    end
  end
end
