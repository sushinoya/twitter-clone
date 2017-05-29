class FollowRequest < ActiveRecord::Base

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  # enum status: {
  #   pending:  'pending',
  #   accepted: 'accepted',
  #   rejected: 'rejected'
  # }

  enum status: [:pending, :accepted, :rejected]


  validates :sender,    presence: true, uniqueness: { scope: [:recipient_id] }
  validates :recipient, presence: true
  validates :status,    presence: true
  validates :status,    inclusion: { in: statuses.keys }
  validate :compare_sender_and_recipient

  private

  def compare_sender_and_recipient
    errors.add(:sender, 'You cannot send a follow request to yourself! Gosh! Get a life man.') if sender == recipient
  end

end
