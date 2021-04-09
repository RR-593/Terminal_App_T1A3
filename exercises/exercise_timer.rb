def display_time_up(instance)
  $sec = instance.floor(-1)/10 if instance > 10
  $min = $sec.floor(-1) / 60 if $sec > 60
  sec = "#{$sec>=10 ? '': '0'}#{$sec>=1 ? $sec - $min * 60: '0'}"
  min = "#{$min>=10 ? '': '0'}#{$min>=1 ? $min: '0'}"
  "#{min}:#{sec}.#{instance - $sec * 10}"
end
