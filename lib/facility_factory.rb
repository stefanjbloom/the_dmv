class FacilityFactory

    attr_reader :facility_created

    def create_ny_facility(data_set)
        @facility_created = data_set.map do |data|
            facility = Facility.new({
                :name => data[:office_name],
                :phone => data[:public_phone_number],
                :address => "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}"
            })
        end
    end

    def create_mo_facility(data_set)
        @facility_created = data_set.map do |data|
            facility =Facility.new({
                
            })
        end

    end

end