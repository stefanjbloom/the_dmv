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


end
