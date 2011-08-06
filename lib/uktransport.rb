require 'uktransport/naptan'
require 'uktransport/cif'

module UKTransport
  class Route
    
    attr_accessor :operator, :journey, :start_date, :end_date, :weekdays, :school_holidays, :bankholidays, :route, :running_board, :vehicle_type, :registration_number, :direction, :stops
    def initialize
      @stops = []
    end
    
    # Does nothing but is called by parsers as a way of providing a hook to save into a database
    def save
    
    end
    
  end
  
  class Stop
    
    attr_accessor :location, :name, :gazetteer, :point_type, :gazetteer_id, :routes
  
    def initialize
      @routes = []
    end
    
    # Does nothing but is called by parsers as a way of providing a hook to save into a database
    def save
    
    end
  end
end
