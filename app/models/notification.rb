class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :noteable, polymorphic: true
  validates :noteable_id, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  validate :notification_belongs_to_enrollments_and_comments

  def notification_belongs_to_enrollments_and_comments
    if noteable_type != "comment" && noteable_type != "enrollment"
      errors.add(:noteable_type, "is not comment or enrollment")
    end
  end
end
