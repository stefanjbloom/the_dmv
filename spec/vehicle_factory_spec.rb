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

    it 'will create vehicles' do
        @factory.create_vehicles(wa_ev_registrations).to eq(@vehicles_created)
        
    end
end
