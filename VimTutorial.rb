
require "rainbow"
require "./models/User"
require "./views/lessons/1"

print "Enter user name: "
name = gets.chomp

if user = User.find(name) 
    puts "Wellcome back "+Rainbow("#{user.name}").color(user.colour)+"!"
else
    puts "[(1)Red, (2)Green, (3)Yellow, (4)Blue, (5)Purple, (6)Light blue]"
    print "Welcome #{name}, whats your favrioute colour: "
    colour = gets.downcase.chomp.to_i
    user = User.new(name, colour)
    user.save
end
