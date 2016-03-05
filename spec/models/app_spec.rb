require 'rails_helper'

RSpec.describe App, type: :model do
  let(:my_user) {create(:user)}
  let(:my_application) {create(:app, user_id: my_user.id)}


  #it {should allow_value(my_application.url).for(:url)}

  it {should allow_value("http://my_app.xyz").for(:url)}
  it {should allow_value("https://my_app.xyz").for(:url)}
  it {should allow_value("https://www.my_app.xy").for(:url)}
  it {should allow_value("www.my_app.xyz").for(:url)}
  it {should allow_value("http://my.app.xyz").for(:url)}

  it {should_not allow_value("http://my_application").for(:url)}
  it {should_not allow_value("htt://my_application.com").for(:url)}
  it {should_not allow_value("ww.my_application.io").for(:url)}

  it {should belong_to(:user)}

  describe "attributes" do
    it "should respond to user_id" do
      expect(my_application).to respond_to(:user_id)
    end
    it "should respond to url" do
      expect(my_application).to respond_to(:url)
    end
  end

end
