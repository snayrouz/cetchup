class BoardMember < ApplicationRecord
  attr_accessible :admin, :board_id, :member_id

  belongs_to :board
  belongs_to :member, class_name: "User"
  has_many :lists

  validates_uniqueness_of :board_id, scope: [:board_id, :member_id]
  validates_uniqueness_of :member_id, scope: [:member_id, :board_id]
end
