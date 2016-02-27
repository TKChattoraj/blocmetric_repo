require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {create(:user)}


  it {should allow_value("user@chattoraj.com").for(:email)}
  it {should allow_value("user@chattoraj.io").for(:email)}
  it {should_not allow_value("user@@chattoraj.com").for(:email)}
  it {should_not allow_value("userchattoraj.com").for(:email)}

  it {should validate_length_of(:password).is_at_least(8)}
  it {should validate_length_of(:password).is_at_most(72)}

  describe "attributes" do
    it "should respond to username" do
      expect(user).to respond_to(:username)
    end
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end
end
