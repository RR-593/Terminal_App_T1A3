# frozen_string_literal: true

def display_time_up(instance)
  $min = instance / 60 if (instance % 60).zero?
  $hour = $min / 60 if ($min % 60).zero?
  "#{$hour}:#{$min - $hour * 60}:#{instance - $min * 60}"
end
