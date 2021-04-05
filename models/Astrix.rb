
class Astrix
  attr_reader :location
  attr_accessor :colour

  ASTRIXS = []

  def initialize (location,colour = :red)
    @location = location
    @colour = colour
    ASTRIXS << self
  end

  def self.find(location)
    return if @location
    ASTRIXS.detect {|astrix| astrix.location == location}
  end

  def self.all
    ASTRIXS
  end
end