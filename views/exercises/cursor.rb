require "rainbow"

module Views
  module Exercises
    def self.highlight_cursor(cursor,lines)
      characters = lines[cursor[1]].chars
      characters[cursor[0]] = Rainbow(Rainbow(characters[cursor[0]]).color(:black)).background(:white)
      lines[cursor[1]] = characters.join('')
    end

    def self.colour_astrixs(cursor,lines)

      astrix_count = 0
      coloured_lines = ""


      lines.each_with_index {|line, line_i| 
        coloured_lines << "\n#{Rainbow("||").color($user.colour)} " + line.chars.each_with_index {|char, char_i|
          if char == "*"
            astrix_count += 1 

            colour = :red

            if  [char_i-10,line_i] == cursor || astrix_number = $astrixs.detect{|num| num == astrix_count}
              $astrixs.concat([astrix_count]).uniq!
              colour = :green
            end

            char.sub!(/[*]/, Rainbow("*").color(colour) )
          end
        }.join('') + " #{" "*(60 -line.chomp.chars.length + (cursor[1] == line_i ? 14 : 0)).abs}#{Rainbow("||").color($user.colour)}"
      }
      coloured_lines
    end
        
    def self.print_doc(cursor,lines)

      print_lines = (lines).map(&:dup)

      print_lines[cursor[1]] = highlight_cursor(cursor,print_lines)

      print Rainbow("++"+("="*62)+"++").color($user.colour)
      puts colour_astrixs(cursor,print_lines)
      puts Rainbow("++"+("="*62)+"++").color($user.colour)
    end
  end
end