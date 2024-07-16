require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
    end

RSpec.describe '#registrant' do

    before(:each) do
        @registrant = Registrant.new('Stefan', 35, true)
    end

    it 'exists' do
        expect(@registrant).to be_instance_of(Registrant)
    end

    it 'has a name' do
        expect(@registrant.name).to eq("Stefan")
    end

    it 'has an age' do
        expect(@registrant.age).to eq(35)
    end

    it 'has a permit' do
        expect(@registrant.permit).to eq(true)
    end

    it 'has permit set to false by default' do
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_2.permit?).to eq(false)
    end

    it 'has license data' do
        expect(@registrant.license_data).to eq({:written => false, :license => false, :renewed => false})
    end

    it 'can earn a permit' do
        expect(@registrant.earn_permit).to eq(true)
    end

    describe '#take written test' do 
        it 'can take a written test' do
            expect(@registrant.license_data[:written]).to eq (false)

            @registrant.take_written_test

            expect(@registrant.license_data[:written]).to eq(true)
        end

        it 'can only take a written test if theyre over age 16' do
            @registrant = Registrant.new('Tucker', 15 )
            expect(@registrant.license_data[:written]).to eq (false)
        end

        it 'can only take a written test if they have a permit' do
            @registrant = Registrant.new('Penny', 16 )
            expect(@registrant.license_data[:written]).to eq (false)
        end
    end

    describe '#take road test' do
        it 'grants a license' do
            expect(@registrant.license_data[:license]).to eq (false)

            @registrant.take_road_test

            expect(@registrant.license_data[:license]).to eq(true)
        end
    end

    describe '#renew drivers license' do
        it 'sets license data renewed to true' do
            @registrant.set_renewed

            expect(@registrant.license_data[:renewed]).to eq(true)
        end
    end

end