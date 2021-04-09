require_relative './GetChr'

module VimControls
  def self.basic_case(cursor,str)
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

  def self.advance_case(cursor,str)
    case str
    when 'w'

    when 'b'

    when 'e'

    else
      cursor, non_alpha_chr = basic_case(cursor,str)
    end
    [cursor, non_alpha_chr]
  end

  def self.basic(cursor)
    str = getchr
    basic_case(cursor,str)
  end

  def self.advance(cursor,line)
    str = getchr
    advance_case(cursor,str)
  end

  def self.powered(cursor)
  end
end