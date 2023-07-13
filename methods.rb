class Parking
    @@slots_count=0
    @@vehicles_count=0
    @@empty_slots_count=0
    def initialize
        @slots=[]
    end
    def addSlot
        @slots.push(0)
        @@slots_count+=1
        @@empty_slots_count+=1
        puts "New slot is created!"
        puts
    end
    def displayParkingDetails
        puts
        puts "/"*30
        puts "Total slots - #{@@slots_count}"
        puts "Vehicles count - #{@@vehicles_count}"
        puts "Empty slots count - #{@@empty_slots_count}"
        puts "/"*30
        puts
    end
    def displaySlots
        puts 
        puts "Slots view"
        print @slots
        puts
        puts
    end
    def addVehicle(vehicleObject,parking)
        for slot in (0...@slots.length)
            if @slots[slot]==0
                @slots[slot]=vehicleObject
                @@vehicles_count+=1
                @@empty_slots_count-=1
                return
            end
        end
        parking.addSlot
        @slots[-1]=vehicleObject
        @@vehicles_count+=1 
        @@empty_slots_count-=1
        puts "*"*30
        puts "vehicle added successfully"
        puts "*"*30
    end
    def removeVehicle
        puts "for removing vehicle .."
        for i in (0...@slots.length)
            puts "#{i} - #{@slots[i]}"
        end
    end

end

class Vehicle
    def initialize(userName)
        @id=Time.new
        @user_name=userName
    end
    def vehicleObject
        return {:id=>@id,:user_name=>@user_name}
    end
end


def askTaskOption
    puts "Select the following task option:"
    puts "1 - Create Slot"
    puts "2 - Add vehicle"
    puts "3 - Remove vehicle"
    puts "4 - View slots"
    puts "0 - Quit the parking area !"
    puts
end

def activateTask(option,parking)
    system "clear"
    puts "-"*20
    puts "You selected - #{option}"
    puts "-"*20
    puts
    case option
    when "1"
        parking.addSlot
    when "2"
        puts "Enter the vehicle user name:"
        vehicle=Vehicle.new(gets.chomp)
        parking.addVehicle(vehicle.vehicleObject,parking)
    when "3"
        parking.removeVehicle
        gets
        puts "Vehicle removed!"
    when "4"
        parking.displaySlots
        parking.displayParkingDetails
    else
        puts "Invalid option"
    end
end