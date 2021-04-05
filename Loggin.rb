require "rainbow"
require_relative "./models/User"

def loggin
    print "\nEnter user name: "
    name = gets.chomp
    colours = [:red, :green, :yellow, :blue, :purple, :cyan]
    if $user = User.find(name) 
        puts "\nWellcome back "+Rainbow("#{$user.name}").color($user.colour)+"!"
    else
        print "\n["
        colours.each_with_index {|colour,i| 
            print "(#{i+1})#{Rainbow(colour.to_s.capitalize).color(colour)}"
            print ", " if colour != colours.last}
        print "]"
        
        print "\nWelcome #{name}, whats your favrioute colour: "
        colour = gets.downcase.chomp

        colour = colour.chr =~ /[^0-9]/ ? colour.to_sym : colours[colour.chr.to_i-1]

        $user = User.new(name, colour)
        $user.save
    end
end