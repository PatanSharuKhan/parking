# frozen_string_literal: true

module Vehicles
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
      {
        id: @id,
        user_name: @user_name,
        vehicle_number: @vehicle_number,
        lisence_number: @lisence_number,
        arrival_time: @arrival_time
      }
    end
  end
end
