
require "./controllers/VimControlls"
require "./views/menu/menu"
require "./models/Menus"

module Routes
    def self.menu(menu)
        cursor = menu.cursor
        Views::Menu.main(cursor,menu)
        menu_length = menu.selections.length
        
        cursor, return_chr = vicont(cursor)
        if return_chr
            Routes::lesson if cursor == 0
            cursor = nil if cursor == menu_length - 1
        else 
            cursor = menu_length - cursor.abs if cursor < 0
            cursor = 0 if cursor > menu_length - 1
        end
        return cursor

        #cursor = Routes::menu(cursor, menus[1]) while main.cursor != nil
    end

    def self.Lessons
        
    end
end