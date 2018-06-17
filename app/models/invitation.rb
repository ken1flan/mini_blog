# frozen_string_literal: true

# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  email         :string(256)      not null
#  message       :text             not null
#  introducer_id :integer          not null
#  token         :string           not null
#  expired_at    :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_invitations_on_introducer_id  (introducer_id)
#

class Invitation < ApplicationRecord
  belongs_to :introducer, class_name: 'User'
  before_create :set_token_and_expired_at

  scope :within_time_limit, -> { where('invitations.expired_at >= ?', Time.zone.now) }

  EXPIRATION_PERIOD = 3.days

  validates :email, presence: true, length: { maximum: 256 }
  validates :message, presence: true, length: { maximum: 256 }
  validates :introducer_id, presence: true

  private

  def set_token_and_expired_at
    loop do
      self.token = SecureRandom.urlsafe_base64
      break if Invitation.where(token: token).empty?
    end

    self.expired_at ||= EXPIRATION_PERIOD.since
  end
end
