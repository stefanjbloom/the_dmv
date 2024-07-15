class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

# above here is original fork. below is my work

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') == true
      @registered_vehicles << vehicle
      vehicle.set_registration_date
      vehicle.give_plate
        if vehicle.electric_vehicle? == true
          @collected_fees += 200
        elsif vehicle.antique? == true
          @collected_fees += 25
        else
          @collected_fees += 100
        end
        return [vehicle] 
    else 
      return nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') == true && registrant.age >= 16 && registrant.permit? == true
      registrant.take_written_test
    else 
      return false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') == true && registrant.license_data[:written] == true
    registrant.take_road_test
    else 
      false
    end

  end
# Administer a road test
# A road test can only be administered to registrants who have passed the written test
# For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
end

      # require 'pry'; binding.pry
