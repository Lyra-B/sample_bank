require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:balance) }
  it { should validate_presence_of(:name) }
end
