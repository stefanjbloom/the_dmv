class Registrant

    attr_reader :name,
                :age,
                :permit,
                :license_data

    def initialize(name, age, permit = false)
        @name = name
        @age = age
        @permit = permit
    end

# We are defining this registrant class so that visitors can use our services.  
# The registrant should have a name, age, permit, and license_data.
end