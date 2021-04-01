

module Views
    module Menu
        def self.main(arrow, menu)
            content = menu.content
            selections = (menu.selections).map(&:dup)
            selections[arrow] << " <"

            puts content
            puts selections
        end

    end
end