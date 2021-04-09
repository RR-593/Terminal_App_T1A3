require_relative '../exercises/exe_refs'
require_relative '../controllers/MainController'

module Routes
  def self.routes(selection,cursor)
    case selection
    when 'Exercise (1)'
      cursor_exercise(1, 3)
    when 'Exercise (2)'
      cursor_exercise(2, 7)
    when 'Exercise (3)'
      cursor_exercise(3, 13)
    when 'Change Name'
      print "\nEnter user new name: "
      $user.name = gets.chomp
    when 'Change Name'
      MainController::change_name
    when 'Change Colour'
      MainController::change_colour
    when 'Delete Yourself'
      MainController::delete_user
      return 101
    end
    return cursor
  end
end
