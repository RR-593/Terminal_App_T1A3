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

  def self.advance_case(cursor,lines,str)
    case str
    when 'w'
      word_total = 0
      idx = 0
      words = lines[cursor[1]].split(' ')
      idx = words.find_index { |word| 
        word_total += word.length
        word_total += 1 
        word_total>cursor[0]
      }

      
      if idx != words.length - 1
        cursor[0] = word_total
      else 
        cursor[1] += 1
        cursor[0] = 0
      end
    when 'b'
      word_total = 0
      idx = 0
      words = lines[cursor[1]].split(' ')
      idx = words.find_index { |word| 
        word_total += word.length if !(word_total + word.length > cursor[0])
        word_total += 1 
        word_total>cursor[0]
      }

      
      if idx != words.length - 1
        cursor[0] = word_total
      else 
        cursor[1] += 1
        cursor[0] = 0
      end
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

  def self.advance(cursor,lines)
    str = getchr
    advance_case(cursor,lines,str)
  end

  def self.powered(cursor)
  end
end