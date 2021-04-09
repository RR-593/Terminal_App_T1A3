require 'rainbow'
require_relative './models/User'
require_relative './views/reference_views'

def loggin
  cls
  print "\nEnter user name: "
  name = gets.chomp
  if $user = User.find(name)
    puts "\nWellcome back " + Rainbow($user.name.to_s).color($user.colour) + '!'
  else
    Views::User::changecolour(name)

    colour = gets.downcase.chomp

    colour = colour.chr =~ /[^0-9]/ ? colour.to_sym : $colours[colour.chr.to_i - 1]
    $user = User::new(name,colour)
  end
end
