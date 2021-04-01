
require "./controllers/VimControls"
require "./views/menu/menu"
require "./models/Pages"

module Routes
    def self.menu(page)
        cursor = page.cursor
        Views::Menu.main(cursor,page)
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
        return cursor
    end
end