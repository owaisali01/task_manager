class AssignedTask < ActiveRecord::Base
    belongs_to :users
    belongs_to :tasks
end
