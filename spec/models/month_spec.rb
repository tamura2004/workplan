require 'rails_helper'

RSpec.describe Month, type: :model do
  it { expect(build :month).to be_valid}
end
