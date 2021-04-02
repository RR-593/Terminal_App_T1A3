

module Views
    module Page
        def self.main(arrow, page)
            content = page.content
            selections = (page.selections).map(&:dup)
            selections[arrow] << " <"

            puts content
            puts selections
        end

    end
end