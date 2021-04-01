require_relative "./ActiveRecord"

class Menu < ActiveRecord
    attr_reader :selections, :name
    attr_accessor :cursor

    def initialize(name,selections,selected = false, cursor = 0)
        @name = name
        @selections = selections
        @cursor = cursor
        @selected = selected
    end
end