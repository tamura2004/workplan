require 'rails_helper'

RSpec.describe Dept, type: :model do
  it { expect(build :dept).to be_valid }
end
