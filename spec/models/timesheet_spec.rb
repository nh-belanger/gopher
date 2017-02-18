require 'rails_helper'

describe Timesheet, type: :model do
  it { should have_valid(:member_id).when(1, 400) }
  it { should_not have_valid(:member_id).when(nil, 'string') }

  it { should have_valid(:teetime_id).when(1, 400) }
  it { should_not have_valid(:teetime_id).when(nil, 'string') }
end
