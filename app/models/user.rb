require "digest/md5"

class User < ApplicationRecord
  has_secure_password
  validates :full_name, :password, :email, presence: true
  validates :email, uniqueness: true

  def gravatar_url(size = 32)
    md5 = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{md5}?s=#{size}"
  end

end
