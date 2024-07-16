class Registrant
    
    attr_reader :name,
                :age,
                :permit,
                :license_data,
                :take_written_test

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
        @license_data = {
            :written => false,
            :license => false,
            :renewed => false
        }
    end

    def permit?
        @permit
    end

    def earn_permit
        @permit = true
    end

    def take_written_test
        if @license_data[:written] = true
            true
        else @age < 16 && permit? == false
            false
        end
    end

    def take_road_test
        @license_data[:license] = true
    end

    def set_renewed
        @license_data[:renewed] = true

    end

end
