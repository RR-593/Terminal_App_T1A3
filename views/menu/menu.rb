require_relative "../cls"

module Views
    module Menu
        def self.main(arrow, menu)
            cls
            puts "#{arrow} #{menu.name}"
            puts 'Use "j", "k" to select an option:'
            temp_menu = (menu.selections).map(&:dup)
            temp_menu[arrow] << "<"
            puts temp_menu
        end

    end
end