require 'rails_helper'

RSpec.describe AppsController, type: :controller do

  let(:my_user) {create(:user)}
  let(:other_user) {crreate(:user)}

  let(:my_app) {create(:app, user: my_user)}
  let(:other_app) {create(:app, user: other_user)}



  context "User NOT signed in" do
    describe "GET #show" do
      it "redirects to the login view" do
        get :show, {user_id: my_user.id, id: my_app.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end


    describe "GET #index" do
      it "redirects to the login view" do
        get :index, {user_id: my_user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #edit" do
      it "redirects to the login view" do
        get :edit, {user_id: my_user.id, id: my_app.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "GET #new" do
      it "redirects to the login view" do
        get :new, {user_id: my_user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end



  end

  # Note context of Signed in User doing CRUD on another's app is
  # tested via the pundit policies


  context "Signed in User doing CRUD on own app" do
    before do
      my_user.confirm
      sign_in :user, my_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {user_id: my_user.id, id: my_app.id}
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do
        get :show, {user_id: my_user.id, id: my_app}
        expect(response).to render_template :show
      end
      it "sets the instance @app to my_app and the @user to my_user" do
        get :show, {user_id: my_user.id, id: my_app}
        expect(assigns :user).to eq my_user
        expect(assigns :app).to eq my_app
      end
    end

    describe "GET #index" do
      it "returns http success" do
        get :index, {user_id: my_user.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the index view" do
        get :index, {user_id: my_user.id}
        expect(response).to render_template :index
      end

      it "sets @user to my_user and @apps to my_user's apps" do
        get :index, {user_id: my_user.id}
        expect(assigns(:user)).to eq my_user
        expect(assigns(:apps)).to eq [my_app]
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, {user_id: my_user.id, id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, {user_id: my_user.id, id: my_app.id}
        expect(response).to render_template :edit
      end

      it "sets @app to the specified app" do
        get :edit, {user_id: my_user.id, id: my_app.id}
        expect(assigns(:app)).to eq my_app
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {user_id: my_user.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #new template" do
        get :new, {user_id: my_user.id}
        expect(response).to render_template :new
      end

      it "sets instantiates @app" do
        get :new, {user_id: my_user.id}
        expect(assigns(:app)).not_to be_nil
      end

      it "sets @user to my_user" do
        get :new, {user_id: my_user.id}
        expect(assigns(:user)).to eq my_user
      end
    end


  end

end
