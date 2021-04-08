require_relative "./ActiveRecord"

class User < ActiveRecord
    attr_accessor :name, :colour, :time

    def initialize(name, colour)
        @id = self.object_id
        @name = name
        @colour = colour
        @time = "00:00"
    end

    def print_id
        puts self.object_id
    end
end