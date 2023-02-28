class Api::V1::AssignedTaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :task_id
end
