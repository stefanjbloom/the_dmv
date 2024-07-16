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
        it 'instantiates ny dmv data' do

        end
    end
end
