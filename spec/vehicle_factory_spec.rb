require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
    end

  
RSpec.describe '#VehicleFactory' do
    before(:each) do
        @factory = VehicleFactory.new
        @data = DmvDataService.new.wa_ev_registrations
    end

    it 'exists' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
    end

    it 'will create vehicles based off number of evs in wa' do
        @factory.create_vehicles(@data)
        
        expect(@factory.create_vehicles(@data).count).to eq(@data.count)
    end
end
