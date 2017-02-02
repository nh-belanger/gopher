require 'rails_helper'

describe Teetime, type: :model do
  it { should_not have_valid(:date).when('', nil) }
  it { should have_valid(:date).when(Date.today) }

  it { should_not have_valid(:time).when(nil,'') }
  it { should have_valid(:time).when(Time.now) }

  it { should_not have_valid(:starting_hole).when(nil, '', -1, 0, 19)}
  it { should have_valid(:starting_hole).when(1, 7, 18)}

end
