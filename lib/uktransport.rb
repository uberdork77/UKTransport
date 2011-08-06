require 'uktransport/naptan'
require 'uktransport/cif'

module UKTransport
  class Route
    @stops = []
    attr_accessor :operator, :journey, :start_date, :end_date, :weekdays, :school_holidays, :bankholidays, :route, :running_board, :vehicle_type, :registration_number, :direction, :stops
    def initialize
    
    end
  end
  
  class Stop
    @routes = []
    attr_accessor :location, :name, :gazetteer, :point_type, :gazetteer_id
  
    def initialize
  
    end
  end
end
