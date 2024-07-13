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

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    # vehicle.set_date
    # vehicle.set_plate_type
    # if vehicle_details[:engine] == :ev
    #   @collected_fees += 200
    # elsif vehicle_details[:plate_type] == :antique
    #   @collected_fees += 25
    # else 
    #   @collected_fees += 100
    # end
  end


end
