require 'rails_helper'

RSpec.describe Work, type: :model do
  it { expect(build :work).to be_valid}
end
