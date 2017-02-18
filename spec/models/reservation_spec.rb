require 'rails_helper'

describe Reservation, type: :model do
  it { should have_valid(:date).when(Date.current) }
  it { should_not have_valid(:date).when(nil, '') }

  it { should have_valid(:room).when('grille room', 'pub', 'dining room') }
  it { should_not have_valid(:room).when(nil) }

  it { should have_valid(:party_size).when(1) }
  it { should_not have_valid(:party_size).when(nil, 0, -1) }

end
