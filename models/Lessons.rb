require "./ActiveRecord"

class Lesson
    def initialize(lesson_name, lesson_number, is_complete, objective_name)
        @l_number = lesson_number
        @l_name = lesson_name
        @objective = is_complete
        @o_name = objective_name
    end
end