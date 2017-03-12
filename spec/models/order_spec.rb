require 'rails_helper'

RSpec.describe Order, type: :model do
  it { expect(build :order).to be_valid}
end
