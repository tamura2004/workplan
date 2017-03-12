require 'rails_helper'

RSpec.describe Cost, type: :model do
  it { expect(build :cost).to be_valid}
end
