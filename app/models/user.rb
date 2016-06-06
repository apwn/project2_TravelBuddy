class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50, message: "Name should have a minimum of 2 characters"}
  validates :username,  presence: true, length: { in: 4..15, message: "Username should have a minimum of 4 characters and a maximum of 15 characters" }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..16, message: "Password should have a minimum of 6 characters and a maximum of 16 characters" }, allow_nil: true
  validates :password_confirmation, presence: true, allow_nil: true

  has_secure_password
  has_many :countries
  has_many :badges
end
