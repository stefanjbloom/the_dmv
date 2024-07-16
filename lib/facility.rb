class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees,
              :facility_created

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
  
  def renew_drivers_license(registrant)
    if @services.include?('Renew License') == true && registrant.license_data[:license] == true
      registrant.set_renewed
    else 
      false
    end
  end

  def new_york_facilities(ny_dmv_data)
    @facility_created = ny_dmv_data.map do |ny_data|
      new_york_facilities = Facility.new({
        :name => ny_dmv_data[:office_name],
        :address => ny_dmv_data[:street_address_line_1],
        :phone => ny_dmv_data[:public_phone_number]
        # :services => ny_dmv_data
        # :registered_vehicles => ny_dmv_data
        # :collected_fees => ny_dmv_data
      })
    end
  end
end

# require 'pry'; binding.pry

# I'm skipping colorado dmv and going with the new york facilities.
# new_york_facilities = DmvDataService.new.ny_dmv_office_locations

# missouri_facilities = DmvDataService.new.mo_dmv_office_locations

# pry(main)> require './lib/vehicle'
# #=> true

# pry(main)> require './lib/vehicle_factory'
# #=> true

# pry(main)> require './lib/dmv_data_service'
# #=> true

# pry(main)> require './lib/facility'
# #=> true
# Refactor your code to allow for the creation of Facility objects 
# from another data source - NY State DMV Facilities

#need name/address/phone