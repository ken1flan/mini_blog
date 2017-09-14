# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  nickname     :string(64)       not null
#  icon_url     :string
#  introduction :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ApplicationRecord
  has_many :identities
  has_many :blogs, foreign_key: :author_id
  has_many :invitations, foreign_key: :introducer_id

  validates :nickname, presence: true, length: { maximum: 64 }
  validates :icon_url, length: { maximum: 255 }
  validates :introduction, length: { maximum: 255 }

  def self.create_with_identity(auth)
    nickname = auth[:info][:nickname]
    nickname ||= auth[:info][:name]
    icon_url = auth[:info][:image]
    user = create!(nickname: nickname, icon_url: icon_url)
    user.identities.create(provider: auth[:provider], uid: auth[:uid])

    user
  end

  def self.find_from(auth)
    User.joins(:identities)
        .merge(Identity.where(provider: auth[:provider], uid: auth[:uid]))
        .first
  end
end
