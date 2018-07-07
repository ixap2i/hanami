require 'rails_helper'

describe User do

  it 'is valid with a mail account' do
    user = User.new(
      mail: 'foo@example.com',
      account: 'foo'
    )
    expect(user).to be_valid
  end

  it 'is valid without an account' do

  end


end