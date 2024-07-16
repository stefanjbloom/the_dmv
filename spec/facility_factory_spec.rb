require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe FacilityFactory do 
    it 'can instantiate' do
        @new_york_facilities = FacilityFactory.new
        @missouri_facilities = FacilityFactory.new

        expect(@new_york_facilities).to be_an_instance_of(FacilityFactory)
    end

    describe '#create ny facility' do
        it 'creates a hash within an array' do
            @new_york_facilities = FacilityFactory.new
            @ny_dmv_data = DmvDataService.new.ny_dmv_office_locations
            @new_york_facilities.create_ny_facility(@ny_dmv_data)

            expect(@new_york_facilities.facility_created).to be_an_instance_of(Array)
            expect(@new_york_facilities.facility_created[0]).to be_an_instance_of(Facility)
        end

        it 'matches the amount of ny facility arrays' do
            @new_york_facilities = FacilityFactory.new
            @ny_dmv_data = DmvDataService.new.ny_dmv_office_locations
            @new_york_facilities.create_ny_facility(@ny_dmv_data)

            expect(@new_york_facilities.facility_created.count).to eq(@ny_dmv_data.count)
            require 'pry';binding.pry
        end

    describe '#create mo facility' do
    
    end
end
