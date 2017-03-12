require 'rails_helper'

RSpec.describe Rank, type: :model do
  it { expect(build :rank).to be_valid}
end
