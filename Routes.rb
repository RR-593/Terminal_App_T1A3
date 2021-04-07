require_relative "./controllers/MainController"
require_relative "./controllers/VimControls"
require_relative "./models/Pages"

require_relative "./exercises/exe_refs"

module Routes
    def self.menu(page)
        cursor = page.cursor
        temp_cursor = [0,cursor]
        MainController::display_page(cursor,page)
        menu_length = page.selections.length
        
        temp_cursor, return_chr = vicont(temp_cursor = [0,cursor])
        cursor = temp_cursor[1]


        if return_chr
            if next_menu = Page.find(page.selections[cursor])
                next_menu.cursor = Routes::menu(next_menu) while next_menu.cursor != nil if cursor != menu_length - 1
                next_menu.cursor = 0
            end

            case page.selections[cursor]
            when "Exercise (1)"
              cursor_exercise(1,3)
            when "Exercise (2)"
              cursor_exercise(2,7)
            when "Exercise (3)"
              cursor_exercise(3,13)
            end

            cursor = nil if cursor >= menu_length - 1
        else 
            cursor = menu_length - cursor.abs if cursor < 0
            cursor = 0 if cursor > menu_length - 1
        end
        cursor
    end
end