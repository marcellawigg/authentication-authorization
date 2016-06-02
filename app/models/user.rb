class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  enum role: ["default", "admin"]

  def set_default_role
    self.role ||= :user
  end


end
