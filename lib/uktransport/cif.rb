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
	      route = line.scan(@@service_regex)[0]
	      @routes.push(:operator => route[1].strip, :journey => route[2].strip, :start_date => route[3], :end_date => route[4], :weekdays => route[5], :school_holidays => route[6], :bankholidays => route[7], :route => route[8].strip, :running_board => route[9].strip, :vehicle_type => route[10].strip, :registration_number => route[11].strip, :direction => route[12])
	    elsif ((line =~ /^QL/) == 0)
	      stop = line.scan(@@location_regex)[0]
	      @stops.push(:location => stop[1], :name => stop[2].strip, :gazetteer => stop[3], :point_type => stop[4], :gazetteer_id => stop[5])
	    end
	  }
	end
  end
end
