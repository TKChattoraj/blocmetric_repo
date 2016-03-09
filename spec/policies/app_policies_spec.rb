require 'rails_helper'

describe AppPolicy do
  subject {AppPolicy.new(user_current, app)}

  context "for a visitor--user not signed in" do
    let(:user_current) {nil}
    let(:user) {create(:user)}
    let(:app) {App.create!(url: "http://sample.com", user_id: user.id)}

    it {should forbid_action(:index)}
    it {should forbid_action(:show)}
    it {should forbid_action(:new)}
    it {should forbid_action(:create)}
    it {should forbid_action(:edit)}
    it {should forbid_action(:update)}
    it {should forbid_action(:destroy)}
  end

  context "for a user signed in but doesn't own the app" do

    let(:user_current) {create(:user)}
    let(:another_user) {User.create!(username: "AnotherUser", email: "another@user.com", password: "hello_world", password_confirmation: "hello_world")}
    let(:app) {App.create!(url: "http://sample.com", user_id: another_user.id)}

    it {should permit_action(:index)}
    it {should forbid_action(:show)}
    it {should permit_action(:new)}
    it {should permit_action(:create)}
    it {should forbid_action(:edit)}
    it {should forbid_action(:update)}
    it {should forbid_action(:destroy)}
  end

  context "for a signed in user who owns the app" do

    let(:user_current) {create(:user)}
    #let(:another_user) {User.create!(username: "AnotherUser", email: "another@user.com", password: "hello_world", password_confirmation: "hello_world")}
    let(:app) {App.create!(url: "http://sample.com", user_id: user_current.id)}

    it {should permit_action(:index)}
    it {should permit_action(:show)}
    it {should permit_action(:new)}
    it {should permit_action(:create)}
    it {should permit_action(:edit)}
    it {should permit_action(:update)}
    it {should permit_action(:destroy)}
  end



end
