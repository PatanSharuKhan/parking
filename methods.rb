module Methods
  class Parking
    @@slots_count=0
    @@vehicles_count=0
    @@empty_slots_count=0
    def initialize
      @slots=[]
    end

    def starting_greet
      system 'clear'
      puts '*'*30
      puts 'PARKING MANAGEMENT SYSTEM'
      puts '*'*30
      puts
    end

    def display_task_options
      puts 'Select the following task option:'
      puts '1 - Create Slot'
      puts '2 - Add vehicle'
      puts '3 - Remove vehicle'
      puts '4 - View slots'
      puts '0 - Quit the parking area !'
      puts
    end

    def loop_program_until_exit
      while true
        displayTaskOptions
        userOption=gets.chomp
        break if userOption == '0'
        completeTask userOption
        sleep 1
      end
    end

    def ending_greet
      system 'clear'
      puts
      puts '*'*30
      puts 'THANK YOU ! VISIT AGAIN !'
      puts '*'*30
    end

    def add_slot
      @slots << 0
      @@slots_count+=1
      @@empty_slots_count+=1
      puts 'New slot is created!'
      puts
    end

    def display_parking_details
      puts
      puts '/'*30
      puts "Total slots - #{@@slots_count}"
      puts "Vehicles count - #{@@vehicles_count}"
      puts "Empty slots count - #{@@empty_slots_count}"
      puts '/'*30
      puts
    end

    def display_slots
      puts 
      puts 'Slots view'
      print @slots
      puts
      puts
    end

    def add_vehicle(vehicleObject)
    for slot in (0...@slots.length)
      if @slots[slot]==0
        @slots[slot]=vehicleObject
        @@vehicles_count+=1
        @@empty_slots_count-=1
        puts '*'*30
        puts 'vehicle added successfully'
        puts '*'*30
        return
      end
    end
    parking.addSlot
    @slots[-1] = vehicleObject
    @@vehicles_count += 1 
    @@empty_slots_count -= 1
    puts '*'*30
    puts 'vehicle added successfully'
    puts '*'*30
    end

    def display_vehicles
    puts 'for removing vehicle, enter respective serial numbers:'
    for i in (0...@slots.length)
        puts "#{i} - #{@slots[i]}"
    end
    end

    def remove_vehicle(slot_id)
    for i in (0...@slots.length)
        if slot_id == i
            if @slots[i] == 0
                puts 'The slot you selected is not having vehicle'
                return 
            end
            @slots[i] = 0
            puts 'Vehicle removed!'
            return
        end
    end
    puts 'Entered invalid slot id !'
    end

    def complete_task(option)
    system 'clear'
    puts '-'*20
    puts "You selected - #{option}"
    puts '-'*20
    puts
    case option
    when '1'
        addSlot
    when '2'
        puts 'Enter the vehicle user name:'
        userName = gets.chomp
        puts 'Enter the vehicle number:'
        vehicleNumber = gets.chomp 
        puts 'Enter the vehicle lisence number:'
        lisenceNumber = gets.chomp
        vehicle = Vehicle.new(userName, vehicleNumber, lisenceNumber)
        addVehicle(vehicle.vehicleObject)
    when '3'
        displayVehicles
        slot_id = gets.chomp.to_i
        removeVehicle(slot_id)
    when '4'
        displaySlots
        displayParkingDetails
    else
        puts 'Invalid option !'
        puts 'Enter the valid option !'
    end
    end

    def run 
      startingGreet
      loopProgramUntilExit
      endingGreet
    end
  end

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
