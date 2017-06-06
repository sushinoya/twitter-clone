class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :follow_requests, foreign_key: 'sender_id'
  has_many :requested, through: :follow_requests, source: :recipient
  has_many :tweets, inverse_of: :user

  validates :email,    uniqueness: true
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  validates :status, length: { maximum: 40 }

end
