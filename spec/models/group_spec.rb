require 'rails_helper'

RSpec.describe Group, type: :model do
  it { expect(build :group).to be_valid }
end
