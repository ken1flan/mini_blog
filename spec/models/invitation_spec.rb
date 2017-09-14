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

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe '#create' do
    let(:invitation) { build(:invitation, :with_introducer, token: nil, expired_at: nil) }

    context 'After save' do
      let(:now) { Time.zone.local('2017/8/12 8:35:17') }
      before do
        travel_to now
        invitation.save
      end

      after { travel_back }

      it { expect(invitation.token).not_to be_empty }
      it { expect(invitation.expired_at).to eql(now + 3.days) }
    end
  end
end
