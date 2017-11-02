class List < ApplicationRecord
  acts_as_list

  belongs_to :board
  validates :board_id, :title, presence: true
  default_scope { order(:position) }
end
