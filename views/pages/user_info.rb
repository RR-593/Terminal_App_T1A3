module Views
  module Pages
    def self.user_info
      name = "Your name: #{$user.name}\n"
      fav_colour = "Favorite colour: #{$user.colour.to_s.capitalize}\n"
      best_time = "Best times [m:s.ms]: \n"
      (1..3).each { |i| best_time << "  (#{i}) #{$user.time[i - 1]}\n" }
      name + fav_colour + best_time
    end
  end
end
