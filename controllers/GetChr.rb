def getchr
  begin
      system('stty raw -echo')
      str = STDIN.getc
  ensure
    system('stty -raw echo')
  end
  str.chr
end
