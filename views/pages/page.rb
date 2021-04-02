module Views
    module Page
        def self.main(arrow, page)
            content = page.content
            selections = (page.selections).map(&:dup)
            selections[arrow] << " <"

            puts page.name.capitalize + "\n\n"
            puts content + "\n\n"
            puts selections
        end

    end
end