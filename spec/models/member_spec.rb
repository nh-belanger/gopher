require 'rails_helper'

describe Member, type: :model do
  it { should have_valid(:first_name).when('Nick', 'Joe') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Belanger', 'Hutchinson') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'user', '.com') }

  it 'has a matching password confirmation for the password' do
    member = Member.new
    member.password = 'password'
    member.password_confirmation = 'notpassword'

    expect(member).to_not be_valid
    expect(member.errors[:password_confirmation]).to_not be_blank
  end
end
