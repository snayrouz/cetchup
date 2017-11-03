class BoardActivity < ApplicationRecord
  attr_accessible :board_id, :member_id, :description

  belongs_to :member, class_name: "User"
  belongs_to :board
end
