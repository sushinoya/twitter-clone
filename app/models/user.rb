class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  validates :status, length: { maximum: 20 }

end
