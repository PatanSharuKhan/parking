# frozen_string_literal: true

# parking module
module Parking1
  # inherit parking2 module
  class Park1
    def display_task_options
      puts "\nSelect the following task option:"
      puts '1 - Create Slot'
      puts '2 - Add vehicle'
      puts '3 - Remove vehicle'
      puts '4 - View slots'
      puts "0 - Quit the parking area !\n\n"
    end

    def display_vehicles(slots)
      puts "#{'-' * 60}\n---[ id - name - phone_number - lisence_number ]---\n#{'-' * 60}"
      slots.length.times do |i|
        p "#{i + 1} - #{slots[i].user_name} - #{slots[i].mobile_number} - #{slots[i].lisence_number}" if slots[i] != 0
      end
    end

    def display_slots(slots)
      puts "#{'-' * 60}\n---[ id - name - phone_number - lisence_number ]---\n#{'-' * 60}"
      slots.length.times do |i|
        p "#{i + 1} - #{slots[i].user_name} - #{slots[i].mobile_number} - #{slots[i].lisence_number}" if slots[i] != 0
      end
    end

    def display_parking_details(slots_count, vehicles_count, empty_slots_count)
      puts "\nTotal slots - #{slots_count}"
      puts "Vehicles count - #{vehicles_count}"
      puts "Empty slots count - #{empty_slots_count}\n\n"
    end

    def bring_verified_name
      loop do
        name = gets.chomp
        return name unless name.empty? || name.match(/\d/)

        puts 'enter valid name / should not be empty / should not contain numbers.'
      end
    end

    def are_alphanum(word1, word2)
      return false if word1.nil? || word2.nil?

      word = word1 + word2
      word.length.times do |i|
        return false unless word[i].match(/\w/)
      end
      true
    end

    def are_cond_satisfied(code, code_lst)
      cond = true
      return false if code.empty? || code_lst.length <= 3
      return false if code_lst[0].match(/\d/) || !(code_lst[1].to_i.is_a? Integer)
      return false unless are_alphanum(code_lst[2], code_lst[3])

      cond
    end

    def bring_verified_vehicle_number
      loop do
        code = gets.chomp
        code_lst = code.split(' ')
        return code if are_cond_satisfied(code, code_lst)

        puts 'Vehicle number is not valid! ex:- UP 50 BY 1998'
      end
    end

    def bring_verified_lisence_number
      loop do
        input = gets.chomp
        puts 'number should be length 15' if input.length != 15
        next if input.length != 15

        is_valid = check_is_alphanumeric input
        return input if is_valid
      end
    end

    def check_is_alphanumeric(input)
      input.length.times do |i|
        next if input[i].match(/\w/)

        puts 'Enter valid lisence number!'
        return false
      end
      true
    end

    def check_are_alphanumeric(num)
      num.length.times do |i|
        unless num[i].match(/\d/)
          puts 'Invalid number entered!'
          return false
        end
      end
      true
    end

    def bring_verified_mobile_number
      loop do
        num = gets.chomp
        puts 'Enter valid number' if num.length != 10
        next if num.length != 10

        is_valid = check_are_alphanumeric num
        return num if is_valid
      end
    end
  end
end
