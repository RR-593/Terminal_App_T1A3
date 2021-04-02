module Views
    module Exercises
        def self.highlight_cursor(cursor,lines)
            characters = lines[cursor[1]].chars
            characters[cursor[0]] = Rainbow(Rainbow(characters[cursor[0]]).color(:black)).background(:white)
            lines[cursor[1]] = characters.join('')
        end
        
        def self.print_doc(cursor,lines)
            print_lines = (lines).map(&:dup)
            print_lines[cursor[1]] = highlight_cursor(cursor,print_lines)
            print_lines.each {|line| puts line.gsub(/[*]/, Rainbow("*").color(:red))}
        end
    end
end