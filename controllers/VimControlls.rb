require_relative "./GetChr"

def vicont (cursor)
    str = getchr
    case str.downcase
    when "j"
        cursor += 1
    when "k"
        cursor -= 1
    when "\r"
        return_chr = true
    end
    return cursor, return_chr
end