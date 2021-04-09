module Views
  module User
    def self.changecolour(name)
      print "\n["
      $colours.each_with_index do |colour, i|
        print "(#{i + 1})#{Rainbow(colour.to_s.capitalize).color(colour)}"
        print ', ' if colour != $colours.last
      end
      print ']'
      
      print "\n#{name}, whats your favrioute colour: "
    end
  end
end