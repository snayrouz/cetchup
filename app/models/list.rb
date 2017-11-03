class List < ApplicationRecord
  attr_accessible :board_id, :title, :open, :position
  default_scope order: "lists.position"
  acts_as_list

  belongs_to :board
  has_many :cards, dependent: :destroy
end
