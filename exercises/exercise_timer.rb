def display_time_up(instance)
  $min = instance/60 if instance % 60 == 0
  $hour = $min/60 if $min % 60 == 0
  "#{$hour}:#{$min-$hour*60}:#{instance-$min*60}"
end