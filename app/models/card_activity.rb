class CardActivity < ApplicationRecord
  attr_accessible :card_id, :description, :member_id

  belongs_to :member, class_name: "User"
  belongs_to :card
end
