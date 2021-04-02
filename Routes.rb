
require_relative "./controllers/MainController"
require_relative "./controllers/VimControls"
require_relative "./models/Pages"

module Routes
    def self.menu(page)
        cursor = page.cursor
        temp_cursor = [0,cursor]
        MainController::display(cursor,page)
        menu_length = page.selections.length
        
        temp_cursor, return_chr = vicont(temp_cursor = [0,cursor])
        cursor = temp_cursor[1]


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
end