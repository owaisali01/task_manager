class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :board_type
  has_many :board_sections
end
