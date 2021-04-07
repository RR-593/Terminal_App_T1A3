# frozen_string_literal: true

require_relative './refrence_doc'

def cursor_exercise(para = 1, astrix = 3)
  $astrixs = []

  num_para = para
  num_astrix = astrix

  doc_lines = create_doc_n_split(num_para, num_astrix)

  # cursor [chr, line]
  cursor = [0, 0]

  end_next_loop = 0

  non_alpha_chr = nil

  $timer_instance = 0
  timer = Thread.new { loop { ; $timer_instance += 1; sleep 1; } }
  $min = 0
  $hour = 0
  loop do
    display_cursor = cursor_boundries(cursor, doc_lines) unless non_alpha_chr

    # Header ==============
    objective = "Touched asterisks (#{$astrixs.length}/#{num_astrix})"
    Thread.kill(timer) if end_next_loop == true
    objective_cleared = end_next_loop == true ? " Congrats you got them all\n" : ''
    how_to_leave = end_next_loop == true ? "To exit press 'enter'" : ''
    header = middle(objective + objective_cleared,
                    66) + objective + Rainbow(objective_cleared).color(:green) + middle(how_to_leave,
                                                                                        66) + how_to_leave.sub(/exit/,
                                                                                                               Rainbow('exit').color(:red))

    cls
    print border_me_pls(66, header)

    Views::Exercises.print_doc(display_cursor, doc_lines)

    # Footer ============
    print middle(display_time_up($timer_instance), 66) + display_time_up($timer_instance)

    user_input = Thread.new { cursor, non_alpha_chr = vicont(cursor) }
    # kill_it = Thread.new {sleep 1; Thread.kill(user_input)}
    user_input.join

    end_next_loop = true if $astrixs.length == num_astrix
    break if (end_next_loop == true && non_alpha_chr == true) || (non_alpha_chr == true && cursor[1] == 99)
  end
end
