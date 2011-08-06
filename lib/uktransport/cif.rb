require 'rubygems'

module UKTransport
  class Cif
    @stops = []
    @@service_regex = /^QS([NDR])(.{4})(.{6})(\d{8})(\d{8})([01]{7})([SH ])([ ABX])(.{4})(.{6})(.{8})(.{8})(.)$/
    attr_accessor :routes, :stops, :cif
    
	def initialize(filename)
	  @filename = filename
	  @routes = []
	  datafile =  open(filename)
	  datafile.readlines.each { |line|
	    if ((line =~ /^QS/) == 0)
	      @routes.push(line.scan(@@service_regex))
	    end
	  }
	end
  end
end
