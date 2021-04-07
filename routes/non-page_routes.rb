# frozen_string_literal: true

require_relative '../exercises/exe_refs'

module Routes
  def self.routes(selection)
    case selection
    when 'Exercise (1)'
      cursor_exercise(1, 3)
    when 'Exercise (2)'
      cursor_exercise(2, 7)
    when 'Exercise (3)'
      cursor_exercise(3, 13)
    when 'Change Name'
      print "\nEnter user new name: "
      $user.name = gets.chomp
    when 'Change Name'
      print "\nEnter user new name: "
      $user.name = gets.chomp

      $user.save
    when 'Change Colour'
      colours = %i[red green gold deepskyblue skyblue hotpink]
      print "\n["
      colours.each_with_index do |colour, i|
        print "(#{i + 1})#{Rainbow(colour.to_s.capitalize).color(colour)}"
        print ', ' if colour != colours.last
      end
      print ']'

      print "\n#{name}, whats your new favrioute colour: "
      colour = gets.downcase.chomp

      colour = colour.chr =~ /[^0-9]/ ? colour.to_sym : colours[colour.chr.to_i - 1]
      $user.colour = colour

      $user.save
    end
  end
end
