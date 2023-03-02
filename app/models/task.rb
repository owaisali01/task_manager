class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :board_section
  has_many :assigned_tasks
  has_many :users, through: :assigned_tasks
  has_many :sub_tasks
  has_many :comments
  has_many :documents
end
