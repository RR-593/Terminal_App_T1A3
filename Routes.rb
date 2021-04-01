
require_relative "./views/cls"
require_relative "./controllers/VimControls"
require_relative "./views/menu/menu"
require_relative "./models/Pages"

module Routes
    def self.menu(page)
        cursor = page.cursor
        Routes::display(cursor,page)
        menu_length = page.selections.length
        
        cursor, return_chr = vicont(cursor)
        if return_chr
            if next_menu = Page.find(page.selections[cursor])
                next_menu.cursor = Routes::menu(next_menu) while next_menu.cursor != nil if cursor != menu_length - 1
                next_menu.cursor = 0
            end
            cursor = nil if cursor >= menu_length - 1
        else 
            cursor = menu_length - cursor.abs if cursor < 0
            cursor = 0 if cursor > menu_length - 1
        end
        cursor
    end

    def self.display(cursor,page)
        cls
        case page.name
        when "User info"
            colour = $user.colour
            page.content = 
"Your name: #{$user.name}\n
Favorite colour: #{Rainbow(colour.to_s.capitalize).color(colour)}\n
Progress: #{$user.progress}\n"
        end
        Views::Menu.main(cursor,page)
    end
end