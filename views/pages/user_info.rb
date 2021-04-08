module Views
  module Pages
    def self.user_info
      name = "Your name: #{$user.name}\n"
      fav_colour = "Favorite colour: #{$user.colour.to_s.capitalize}\n"
      best_time = "Best times [m:s]: \n  (1) #{$user.time}\n  (2) #{$user.time}\n  (3) #{$user.time}"
      name + fav_colour + best_time
    end
  end
end
