# frozen_string_literal: true

require './parking2'

# parking module
module Parking1
  # inherit parking2 module
  class Park1 < Parking2::Park2
    def display_vehicles(mod_slots)
      puts "#{'-' * 60}\n---[ id - name - phone_number - lisence_number - email ]---\n#{'-' * 60}"
      mod_slots.length.times do |i|
        p "#{i + 1} - #{mod_slots[i].user_name} - #{mod_slots[i].mobile_number} - #{mod_slots[i].lisence_number} - #{mod_slots[i].email}"
      end
    end

    def display_slots
      if @slots.empty?
        puts "\nSlots not available\n"
        return ''
      end
      puts "#{'-' * 60}\n---[ id - name - phone_number - lisence_number - email ]---\n#{'-' * 60}"
      @slots.length.times do |i|
        @slots[i] != 0 ? print_details(i) : puts("#{i + 1} - empty slot")
      end
    end

    def display_parking_details
      puts "\nTotal slots - #{@slots_count}"
      puts "Vehicles count - #{@vehicles_count}"
      puts "Empty slots count - #{@empty_slots_count}\n\n"
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
      return false if check_are_numeric(code_lst[0]) || !check_are_numeric(code_lst[1])
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

    def check_are_numeric(num)
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

        is_valid = check_are_numeric num
        return num if is_valid
      end
    end
  end
end
