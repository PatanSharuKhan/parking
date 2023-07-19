# frozen_string_literal: true

module Vehicles
  # vehicle class
  class Vehicle
    attr_accessor :user_name, :vehicle_number, :lisence_number, :mobile_number

    def initialize(user_name, vehicle_number, lisence_number, mobile_number)
      @id = Time.new
      @user_name = user_name
      @vehicle_number = vehicle_number
      @lisence_number = lisence_number
      @mobile_number = mobile_number
      @arrival_time = Time.new
    end

    def vehicle_object
      {
        'id': @id,
        'user_name': @user_name,
        'vehicle_number': @vehicle_number,
        'lisence_number': @lisence_number,
        'mobile_number': @mobile_number,
        'arrival_time': @arrival_time
      }
    end
  end
end
