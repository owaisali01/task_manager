class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :due_date, :story_point, :board_id, :board_section_id
end
