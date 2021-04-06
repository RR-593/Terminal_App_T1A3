
def getchr
  begin
      system("stty raw -echo")
      str = STDIN.getc
    ensure
      system("stty -raw echo")
  end
  return str.chr
end


mins=0
hours=0
0.upto(9000) do |i|
  cls = "\e[H\e[2J"
  puts cls
  mins = i/60 if i % 60 == 0
  hours = mins/60 if mins % 60 == 0

  puts "#{hours}:#{mins-hours*60}:#{i-mins*60}"

  print "Enter something: "
  user_input = Thread.new do Thread.current[:value] = getchr end

  timer = Thread.new { sleep 0.01; user_input.kill; puts }

  user_input.join
  if user_input[:value]
    puts "#{user_input[:value]}"
    break
  end
end