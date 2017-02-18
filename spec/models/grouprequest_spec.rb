require 'rails_helper'

describe Grouprequest, type: :model do
  it {should have_valid(:member_id).when(1, 500) }
  it {should_not have_valid(:member_id).when(nil,'string')}

  it {should have_valid(:group_id).when(1, 500) }
  it {should_not have_valid(:group_id).when(nil, 'string')}
end
