require_relative "./ActiveRecord"

class User < ActiveRecord
    attr_reader :name, :colour, :progress

    def initialize(name, colour)
        @id = self.object_id
        @name = name
        @colour = colour
        @progress = []
    end

    def print_id
        puts self.object_id
    end
end