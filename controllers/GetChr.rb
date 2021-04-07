# frozen_string_literal: true

def getchr
  begin
      system('stty raw -echo')
      str = $stdin.getc
  ensure
    system('stty -raw echo')
  end
  str.chr
end
