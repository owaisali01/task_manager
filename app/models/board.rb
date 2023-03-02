class Board < ActiveRecord::Base
  paginates_per 3
  belongs_to :user
  has_many :board_sections
end
