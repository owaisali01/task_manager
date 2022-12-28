class Task < ActiveRecord::Base
    belongs_to :user
    belongs_to :board
    belongs_to :board_section
    has_many :assigned_tasks
    has_many :sub_tasks
    has_many :comments
end
