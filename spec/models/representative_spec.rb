require 'rails_helper'

RSpec.describe Representative, type: :model do
  describe 'attributes' do
    it { should validate_presence_of(:repid) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:party) }
    it { should validate_presence_of(:seniority) }
    it { should validate_presence_of(:district) }

    it { should validate_uniqueness_of(:repid) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:district) }
  end
end
