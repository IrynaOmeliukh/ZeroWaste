require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) { build(:admin) }
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_length_of(:email).is_at_least(6) }
    it { is_expected.to validate_length_of(:email).is_at_most(100) }
    it { is_expected.to allow_value('email@gmail.com').for(:email) }
    it { is_expected.not_to allow_value('email.factory-com').for(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to allow_value('ddc5+8555dd').for(:password) }
  end
end
