
require_relative "./refrence_doc"

def cursor_exercise(para=1,astrix=3)
  $astrixs = []

  num_para = para
  num_astrix = astrix

  doc_lines = create_doc_n_split(num_para,num_astrix)

  #cursor [chr, line]
  cursor = [0,0]

  non_alpha_chr = nil

  begin

    display_cursor = cursor_boundries(cursor,doc_lines) if !non_alpha_chr

    cls
    Views::Exercises.print_doc(display_cursor,doc_lines)

    cursor, non_alpha_chr = vicont(cursor)
  end until non_alpha_chr == true && cursor[1] == 99

end