require 'rubygems'
require 'fastercsv'

module UKTransport
  class Naptan
    include Enumerable
    attr_accessor :stops, :filename
    
    def initialize(filename)
      @filename = filename
      # Note that this is probably a really bad idea for anything of any size
      @stops = FasterCSV.read("/home/kaerast/data/Stops_extract.csv")
    end
    
    def each(&block)
      @stops.each(&block)
    end
    
    def <<(val)
      @stops << val
    end
  end
end
