require 'uktransport/naptan'
require 'uktransport/cif'
require 'json'

module UKTransport
  class Route
    
    attr_accessor :operator, :journey, :start_date, :end_date, :weekdays, :school_holidays, :bankholidays, :route, :running_board, :vehicle_type, :registration_number, :direction, :stops
    def initialize
      @stops = []
    end
    
    # Does nothing but is called by parsers as a way of providing a hook to save into a database
    def save
    
    end
    
    def to_json(*a)
      {
        "operator" => @operator,
        "journey" => @journey,
        "start_date" => @start_date,
        "end_date" => @end_date,
        "weekdays" => @weekdays,
        "school_holidays" => @school_holidays,
        "bankholidays" => @bankholidays,
        "route" => @route,
        "running_board" => @running_board,
        "vehicle_type" => @vehicle_type,
        "registration_number" => @registration_number,
        "direction" => @direction,
        "stops" => @stops.to_json
      }.to_json(*a)
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
    
    def to_json(*a)
      {
        "location" => @location,
        "name" => @name,
        "gazetteer" => @gazetteer,
        "point_type" => @point_type,
        "gazetteer_id" => @gazetteer_id,
        "routes" => @routes.to_json
      }.to_json(*a)
    end
  end
end
