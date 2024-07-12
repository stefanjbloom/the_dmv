require 'spec_helper'

RSpec.describe Registrant do

    it 'exists' do
        registrant = Registrant.new(@name, @age, @permit)
        expect(registrant).to be_instance_of(Registrant)
    end

end

        # @registrant_1 = Registrant.new('Bruce', 18, true )
        # @registrant_2 = Registrant.new('Penny', 15 )
        # @registrants = [@registrant_1, @registrant_2]
