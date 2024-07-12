require 'spec_helper'

RSpec.describe Registrant do

    before(:each) do
        registrant = Registrant.new(@name, @age, @permit)
    end

    it 'exists' do
        registrant = Registrant.new(@name, @age, @permit)
        expect(registrant).to be_instance_of(Registrant)
    end

    it 'has a name' do
        registrant = Registrant.new(@name, @age, @permit)

        expect(registrant.name).to eq(@name)
    end

    it 'has an age' do
        registrant = Registrant.new(@name, @age, @permit)

        expect(registrant.age).to eq(@age)
    end

    it 'has a permit' do
        registrant = Registrant.new(@name, @age, @permit)

        expect(registrant.permit).to eq(@permit)
    end


end

