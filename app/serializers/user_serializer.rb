class UserSerializer < ActiveModel::Serializer
  attributes :id, :bio, :email, :full_name
end
