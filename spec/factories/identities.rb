# frozen_string_literal: true

# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  provider   :string(64)       not null
#  uid        :string(64)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_identities_on_provider_and_uid  (provider,uid) UNIQUE
#  index_identities_on_user_id           (user_id)
#

FactoryBot.define do
  factory :identity do
    user_id nil
    provider 'google_oauth2'
    sequence(:uid) { |n| "uid#{n}" }
  end
end
