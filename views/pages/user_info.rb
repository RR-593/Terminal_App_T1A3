module Views
    module Pages
        def self.user_info(colour)
            name = "Your name: #{$user.name}\n"
            fav_colour = "Favorite colour: #{Rainbow(colour.to_s.capitalize).color(colour)}\n"
            progress = "Progress: #{$user.progress}\n"
            return name + fav_colour + progress
        end
    end
end