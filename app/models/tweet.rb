class Tweet < ActiveRecord::Base

  belongs_to :user, inverse_of: :tweets
  validates :text, presence: true
  validates :text, length: { maximum: 140 }
  validates :user_id, presence: true

end
