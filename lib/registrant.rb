class Registrant
# Reminder that I built this object/not forked
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
    # if @age >= 16 && permit? == false
    #  false
    # else registrant.take_written_test
    # end

end
