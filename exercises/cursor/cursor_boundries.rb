def cursor_boundries(cursor, doc_lines)
  cursor[1] = 0 if cursor[1] < 0
  cursor[1] = doc_lines.length - 1 if cursor[1] > doc_lines.length - 1
  cursor[0] = 0 if cursor[0] < 0
  cursor[0] = doc_lines[cursor[1]].chomp.chars.length - 1 if cursor[0] > doc_lines[cursor[1]].chomp.chars.length - 1
  cursor
end
