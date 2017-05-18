class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true

end
