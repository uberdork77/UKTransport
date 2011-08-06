require 'rubygems'

module UKTransport
  class Cif
    @stops = []
    @@service_regex = /^QS([NDR])(.{4})(.{6})(\d{8})(\d{8})([01]{7})([SH ])([ ABX])(.{4})(.{6})(.{8})(.{8})(.)$/
    @@location_regex = /^QL([NDR])(.{12})(.{48})(.)(.)(.{8})/
    @@origin_regex = /^QO(.{12})(\d{4})(.{3})(T[01])(F[01])/
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
	      route.save
	      @routes.push(route)
	    elsif ((line =~ /^Q[OIT]/) == 0)
	      stopline = line.scan(/^Q[OIT](.{12})/)[0]
	      stop = UKTransport::Stop.new
	      stop.location = stopline[0]
	      stop.save
	      @routes.last.stops.push stop
	    elsif ((line =~ /^QL/) == 0)
	      stopline = line.scan(@@location_regex)[0]
	      stop = UKTransport::Stop.new
	      stop.location = stopline[1]
	      stop.name = stopline[2].strip
	      stop.gazetteer = stopline[3]
	      stop.point_type = stopline[4]
	      stop.gazetteer_id = stopline[5]
	      stop.save
	      @stops.push(stop)
	    end
	  }
	end
  end
end
