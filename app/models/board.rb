class Board < ActiveRecord::Base
    belongs_to :user
    has_many :board_sections
    has_many :tasks
end
