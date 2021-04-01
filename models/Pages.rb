require_relative "./ActiveRecord"

class Page < ActiveRecord
    attr_reader :selections, :name
    attr_accessor :cursor

    def initialize(name,selections, cursor = 0)
        @name = name
        @selections = selections
        @cursor = cursor
    end
end