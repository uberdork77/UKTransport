require 'rubygems'
require 'fastercsv'

module UKTransport
  class Naptan
    include Enumerable
    extend Forwardable
    attr_accessor :stops, :filename
    
    def initialize(filename)
      @filename = filename
      # Note that this is probably a really bad idea for anything of any size
      @stops = FasterCSV.read(filename)
    end
    
    def_delegators :@stops, :<<, :[], :[]=, :last
    
    def each(&block)
      @stops.each(&block)
    end
    
    def <<(val)
      @stops << val
    end
    
    def all
      @stops
    end
  end
end
