class CardComment < ActiveRecord::Base

  belongs_to :card
  belongs_to :commenter, class_name: 'User'

  validates_presence_of :card, :commenter, :content

  default_scope { order(created_at: :desc) }

  def created_at_timestamp
    created_at.to_time.to_i
  end
end
