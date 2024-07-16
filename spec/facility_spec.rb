require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
  end

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew License')
      @facility.add_service('Vehicle Registration')
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      expect(@facility.services).to eq(['New Drivers License', 'Renew License', 'Vehicle Registration', 'Written Test', 'Road Test'])
    end
  end

  describe '#register vehicle' do
    it 'starts with an empty array' do
      expect(@facility.registered_vehicles).to eq([])
    end

    it 'can add vehicles to registered vehicles' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      @facility.register_vehicle(@bolt)
      @facility.register_vehicle(@camaro)

      expect(@facility.registered_vehicles).to eq([@cruz, @bolt, @camaro])
    end

    it 'sets todays date as registration date' do
      @facility.register_vehicle(@cruz)

      expect(@cruz.set_registration_date).to eq(Date.today)
    end

    it 'gives a license plate' do
      @facility.register_vehicle(@cruz)

      expect(@cruz.give_plate).to eq(:regular)  
    end
  end


  describe '#collect fees' do
    it 'starts at 0' do
     expect(@facility.collected_fees).to eq(0)
    end

    it 'increases with every vehicle registration' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)

      expect(@facility.collected_fees).to eq(100)
     end
  end

  describe '#administer written test' do
    it 'gives the registrant a written test' do
      @registrant = Registrant.new('Stefan', 35, true)
      expect(@facility.administer_written_test(@registrant)).to eq(false)

      @registrant = Registrant.new('Stefan', 35, true)
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant)

      expect(@facility.administer_written_test(@registrant)).to eq(true)
    end

    it 'can only be administered to registrants 16 and older and with a permit' do
      @registrant = Registrant.new('Penny', 16 )

      expect(@facility.administer_written_test(@registrant)).to eq(false)
    end
  end

  describe '#administer road test' do
    it 'is default to false' do
      @registrant = Registrant.new('Stefan', 35, true)

      expect(@facility.administer_road_test(@registrant)).to eq(false)
    end

    it 'grants license when taken' do
      @registrant = Registrant.new('Stefan', 35, true)
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.administer_written_test(@registrant)
      @facility.administer_road_test(@registrant)

      expect(@facility.administer_road_test(@registrant)).to eq(true)
    end
  end

  describe '#renew license' do
    it 'defaults to false' do
      @registrant = Registrant.new('Stefan', 35, true)

      expect(@facility.renew_drivers_license(@registrant)).to eq(false)
    end

    it 'can renew licenses' do
      @registrant = Registrant.new('Stefan', 35, true)
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew License')
      @facility.administer_written_test(@registrant)
      @facility.administer_road_test(@registrant)
      @facility.renew_drivers_license(@registrant)

      expect(@facility.renew_drivers_license(@registrant)).to eq(true)
    end
  end

  describe '#create new facility' do
    it 'can create a new york facility' do
      @new_york_facilities = Facility.new({name: 'HUNTINGTON', address: '1815 E JERICHO TURNPIKE', phone: '7184774820'})

      expect(@new_york_facilities).to be_an_instance_of(Facility)
    end
  end
  
end