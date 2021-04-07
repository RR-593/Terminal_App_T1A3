# frozen_string_literal: true

require_relative '../views/pages/page'
require_relative '../views/pages/user_info'
require_relative '../views/fanss_display/refrence_displays'

module MainController
  def self.display_page(cursor, page)
    cls
    case page.name
    when 'User info'
      page.content = Views::Pages.user_info
    end
    Views::Page.main(cursor, page)
  end
end
