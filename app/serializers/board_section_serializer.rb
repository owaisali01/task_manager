class BoardSectionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tasks
  belongs_to :board
end
