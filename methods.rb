# frozen_string_literal: true

module Methods
  # parking class
  class Parking
    @slots_count = 0
    @vehicles_count = 0
    @empty_slots_count = 0

    def initialize
      @slots = []
    end

    def display_task_options
      puts 'Select the following task option:'
      puts '1 - Create Slot'
      puts '2 - Add vehicle'
      puts '3 - Remove vehicle'
      puts '4 - View slots'
      puts '0 - Quit the parking area !'
    end

    def run
      loop do
        display_task_options
        user_option = gets.chomp
        break if user_option == '0'

        complete_task user_option
      end
    end

    def add_slot
      @slots << 0
      @slots_count += 1
      @empty_slots_count += 1
      puts 'New slot is created!'
    end

    def display_parking_details
      puts "Total slots - #{@@slots_count}"
      puts "Vehicles count - #{@@vehicles_count}"
      puts "Empty slots count - #{@@empty_slots_count}"
    end

    def display_slots
      puts "Slots view - #{@slots}"
    end

    def update_count_success_view
      @vehicles_count += 1
      @empty_slots_count -= 1
      puts '----------------vehicle added successfully------------------'
    end

    def add_vehicle(vehicle_object)
      (0...@slots.length).each do |slot|
        next unless @slots[slot].zero?

        @slots[slot] = vehicle_object
        update_count_success_view
        return ''
      end
      parking.addSlot
      @slots[-1] = vehicle_bject
      update_count_success_view
    end

    def display_vehicles
      puts 'for removing vehicle, enter respective serial numbers:'
      (0...@slots.length).each do |i|
        puts "#{i} - #{@slots[i]}"
      end
    end

    def remove_vehicle(slot_id)
      (0...@slots.length).each do |i|
        next if slot_id != i

        if @slots[i].zero?
          puts 'The slot you selected is not having vehicle'
          return ''
        end
        @slots[i] = 0
        puts 'Vehicle removed!'
        return ''
      end
      puts 'Entered invalid slot id !'
    end

    def display_selected_option
      system 'clear'
      puts "-------------You selected - #{option}"
    end

    def add_user_vehicle_data
      puts 'Enter the vehicle user name:'
      user_name = gets.chomp
      puts 'Enter the vehicle number:'
      vehicle_number = gets.chomp
      puts 'Enter the vehicle lisence number:'
      lisence_number = gets.chomp
      vehicle = Vehicle.new(user_name, vehicle_number, lisence_number)
      addVehicle(vehicle.vehicleObject)
    end

    def display_and_remove_vehicle
      display_vehicles
      slot_id = gets.chomp.to_i
      removeVehicle(slot_id)
    end

    def activate_selected_option(option)
      case option
      when '1'
        add_slot
      when '2'
        add_user_vehicle_data
      when '3'
        display_and_remove_vehicle
      when '4'
        display_slots
        display_parking_details
      else
        puts 'Invalid option ! Enter the valid option !'
      end
    end

    def complete_task(option)
      display_selected_option
      activate_selected_option option
    end
  end

  # vehicle class
  class Vehicle
    def initialize(user_name, vehicle_number, lisence_number)
      @id = Time.new
      @user_name = user_name
      @vehicle_number = vehicle_number
      @lisence_number = lisence_number
      @arrival_time = Time.new
      @departure_time = ''
    end

    def vehicle_object
      return {
        id: @id,
        user_name: @user_name,
        vehicle_number: @vehicle_number,
        lisence_number: @lisence_number,
        arrival_time: @arrival_time
      }
    end
  end
end
