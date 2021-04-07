# frozen_string_literal: true

def middle(string, size)
  (' ' * ((size - string.chomp.length) / 2)).to_s
end
