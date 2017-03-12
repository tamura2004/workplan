require 'rails_helper'

RSpec.describe System, type: :model do
  it { expect(build :system).to be_valid}
end
