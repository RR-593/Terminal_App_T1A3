require_relative "../views/pages/page"
require_relative "../views/pages/user_info"
require_relative "../views/cls"

module MainController
    def self.display_page(cursor,page)
        cls
        case page.name
        when "User info"
            colour = $user.colour
            page.content = Views::Pages.user_info(colour)
        end
        Views::Page.main(cursor,page)
    end
end