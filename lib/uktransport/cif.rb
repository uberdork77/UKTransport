require 'rubygems'

module UKTransport
  class Cif
    @stops = []
    @@service_regex = /^QS([NDR])(.{4})(.{6})(\d{8})(\d{8})([01]{7})([SH ])([ ABX])(.{4})(.{6})(.{8})(.{8})(.)$/
    @@location_regex = /^QL([NDR])(.{12})(.{48})(.)(.)(.{8})/
    attr_accessor :routes, :stops, :cif
    
	def initialize(filename)
	  @filename = filename
	  @routes = []
	  @stops = []
	  datafile =  open(filename)
	  datafile.readlines.each { |line|
	    if ((line =~ /^QS/) == 0)
	      routeline = line.scan(@@service_regex)[0]
	      route = UKTransport::Route.new
	      route.operator = routeline[1].strip
	      route.journey = routeline[2].strip
	      route.start_date = routeline[3]
	      route.end_date = routeline[4]
	      route.weekdays = routeline[5]
	      route.school_holidays = routeline[6]
	      route.bankholidays = routeline[7]
	      route.route = routeline[8].strip
	      route.running_board = routeline[9].strip
	      route.vehicle_type = routeline[10].strip
	      route.registration_number = routeline[11].strip
	      route.direction = routeline[12]
	      @routes.push(route)
	    elsif ((line =~ /^QL/) == 0)
	      stop = line.scan(@@location_regex)[0]
	      @stops.push(:location => stop[1], :name => stop[2].strip, :gazetteer => stop[3], :point_type => stop[4], :gazetteer_id => stop[5])
	    end
	  }
	end
  end
end
