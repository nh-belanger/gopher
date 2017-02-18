require 'rails_helper'

describe Reservationrequest, type: :model do
  it { should have_valid(:member_id).when(1, 500) }
  it { should_not have_valid(:member_id).when(nil, 'string') }

  it { should have_valid(:reservation_id).when(1, 500) }
  it { should_not have_valid(:reservation_id).when(nil, 'string') }
end
