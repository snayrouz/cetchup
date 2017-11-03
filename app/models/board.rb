class Board < ApplicationRecord
  attr_accessible :description, :name, :open

  has_many :lists
  has_many :board_activities
  has_many :boards_members, class_name: "BoardMember"
  has_many :members, through: :boards_members
end
