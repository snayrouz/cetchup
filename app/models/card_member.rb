class CardMember < ApplicationRecord
  attr_accessible :card_id, :member_id

  belongs_to :card
  belongs_to :member, class_name: "User"

  validates_uniqueness_of :card_id, scope: [:card_id, :member_id]
  validates_uniqueness_of :member_id, scope: [:member_id, :card_id]
end
