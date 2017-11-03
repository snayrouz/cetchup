require "digest/md5"

class User < ApplicationRecord
  attr_accessible :username, :email, :full_name, :bio

  default_scope order: 'id'

  has_many :boards_members,
           class_name: "BoardMember",
           foreign_key: :member_id

  has_many :cards_members,
           class_name: "CardMember",
           foreign_key: :member_id

  has_many :boards, through: :boards_members
  has_many :lists, through: :boards
  has_many :cards, through: :lists

  has_many :cards_assigned,
           class_name: "Card",
           foreign_key: :assignee_id

  validates :email, uniqueness: true
  validates :email, :password_digest, presence: true
  validates_length_of :password, { minimum: 3 }

  has_secure_password

  def gravatar_url(size = 32)
    md5 = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{md5}?s=#{size}"
  end

  def as_json(options = {})
    super(options.merge(only: [:username, :email, :bio],
                        methods: :gravatar_url))
  end
end
