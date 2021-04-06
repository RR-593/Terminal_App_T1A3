
require_relative "./refrence_doc"

def cursor_exercise(para=1,astrix=3)
  $astrixs = []

  num_para = para
  num_astrix = astrix

  doc_lines = create_doc_n_split(num_para,num_astrix)

  #cursor [chr, line]
  cursor = [0,0]

  end_next_loop = 0

  non_alpha_chr = nil

  timer_instance = 0

  $min = 0
  $hour = 0
  begin
    
    display_cursor = cursor_boundries(cursor,doc_lines) if !non_alpha_chr

    # Header ==============
    objective = "Touched *'s (#{$astrixs.length}/#{num_astrix})" 
    objective_cleared = end_next_loop == true ? " Congrats you got them all\n" : ""
    how_to_leave = end_next_loop == true ? "To exit press 'enter'" : ""
    header = middle(objective + objective_cleared,66) + objective + Rainbow(objective_cleared).color(:green) + middle(how_to_leave,66) + how_to_leave.sub(/[e][x][i][t]/,Rainbow("exit").color(:red))
    
    cls
    print border_me_pls(66,header)

    Views::Exercises.print_doc(display_cursor,doc_lines)

    # Footer ============
    #print middle(display_time_up(timer_instance),66) + display_time_up(timer_instance)

    cursor, non_alpha_chr = vicont(cursor)

    end_next_loop = true if $astrixs.length == num_astrix

  end until (end_next_loop == true && non_alpha_chr == true) || (non_alpha_chr == true && cursor[1] == 99)

end