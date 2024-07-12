require 'spec_helper'

RSpec.describe Registrant do

    before(:each) do
        registrant = Registrant.new(@name, @age, @permit)
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant.name).to eq(@name)
        expect(registrant_1.name).to eq('Bruce')
        expect(registrant_2.name).to eq('Penny')

    end

    it 'exists' do
        registrant = Registrant.new(@name, @age, @permit)
        expect(registrant).to be_instance_of(Registrant)
    end

    it 'has a name' do
        registrant = Registrant.new(@name, @age, @permit)
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant.name).to eq(@name)
        expect(registrant_1.name).to eq('Bruce')
        expect(registrant_2.name).to eq('Penny')
    end

end

