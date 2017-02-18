require 'rails_helper'

describe Group, type: :model do
  it {should have_valid(:name).when('Nick Group')}
  it { should_not have_valid(:name).when(nil, '')}
end
