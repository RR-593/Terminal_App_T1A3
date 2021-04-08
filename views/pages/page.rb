require 'rainbow'
require_relative '../../models/User'
require_relative '../fanss_display/refrence_displays'

module Views
  module Page
    def self.main(arrow, page)
      content = page.content
      selections = (page.selections).map(&:dup)
      selections[arrow] << ' <'

      puts "#{'=' * 50}\n\n"
      puts middle(page.name, 50) + "#{Rainbow(page.name.capitalize).color(:yellow)} \n\n"
      puts "#{'=' * 50}\n\n"

      puts Rainbow(content).color($user.colour) + "\n\n"

      puts selections
    end
  end
end
