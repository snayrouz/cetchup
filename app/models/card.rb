class Card < ApplicationRecord
  acts_as_list

  belongs_to :list
  has_one :board, through: :list

  validates :list_id, :title, presence: true
  default_scope { order(:position) }
end
