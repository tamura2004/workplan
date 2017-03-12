require 'rails_helper'

RSpec.describe Assign, type: :model do
  it {
    expect(Assign.new).not.to be_valid
  }
end
