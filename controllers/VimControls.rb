# frozen_string_literal: true

require_relative './GetChr'

def vicont(cursor)
  str = getchr
  case str
  when 'h'
    cursor[0] -= 1
  when 'j'
    cursor[1] += 1
  when 'k'
    cursor[1] -= 1
  when 'l'
    cursor[0] += 1
  when "\r"
    non_alpha_chr = true
  when "\e"
    case getchr + getchr
    when '[A'
      cursor[1] -= 1
    when '[B'
      cursor[1] += 1
    when '[C'
      cursor[0] += 1
    when '[D'
      cursor[0] -= 1
    end
  when 'q'
    non_alpha_chr = true
    cursor[1] = 99
  end
  [cursor, non_alpha_chr]
end
