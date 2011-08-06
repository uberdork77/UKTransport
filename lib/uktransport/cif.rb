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
	      route = line.scan(@@service_regex)
	      @routes.push(route)
	    elsif ((line =~ /^QL/) == 0)
	      stop = line.scan(@@location_regex)
	      @stops.push(stop)
	    end
	  }
	end
  end
end
