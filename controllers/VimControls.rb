require_relative "./GetChr"

def vicont (cursor)
    str = getchr
    case str
    when "j"
        cursor += 1
    when "k"
        cursor -= 1
    when "\r"
        non_alpha_chr = true
    when "q"
        non_alpha_chr = true
        cursor = 99
    end
    return cursor, non_alpha_chr
end