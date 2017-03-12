require 'rails_helper'

RSpec.describe Project, type: :model do
  it { expect(build :project).to be_valid}
end
