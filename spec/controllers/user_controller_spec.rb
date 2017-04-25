require 'rails_helper'

RSpec.describe UserController, type: :controller do
  before :each do
    @user1_password = "secret1"
    @user1 = User.create full_name: "test user1", email: "test_user1@email.com", password: @user1_password
    @user2 = User.create full_name: "test user2", email: "test_user2@email.com", password: "secret2"
  end

  describe "GET #get" do

    it "responds HTTP 401 when provided a empty token" do
      get :get
      expect(response).to have_http_status(:unauthorized)
    end

    it "responds HTTP 401 when provided a invalid token" do
      request.headers["Token"] = '12'
      get :get
      expect(response).to have_http_status(:unauthorized)
    end

    context "when provided a valid user token" do
      it "responds HTTP 200" do
        request.headers["Token"] = @user1.token
        get :get
        expect(response).to have_http_status(:ok)
      end


      it "return the user" do
        request.headers["Token"] = @user1.token
        get :get
        user = JSON.parse(response.body)
        expect(user["id"]).to eq @user1.id
        expect(user["email"]).to eq @user1.email
      end
    end
  end

  describe "POST #get_token" do

    context "when provided a valid email and password" do
      before :each do
        @body = {
          email: @user1.email,
          password: @user1_password
        }
      end

      it "responds HTTP 200" do
        post :get_token, body: @body.to_json, format: :json
        expect(response).to have_http_status(:ok)
      end

      it "returns user token" do
        post :get_token, body: @body.to_json, format: :json
        authorization = JSON.parse(response.body)
        expect(authorization["token"]).to eq @user1.token
      end
    end

    context "when provided a invalid email" do
      before :each do
        @body = {
          email: "wrong_email",
          password: @user1_password
        }
      end

      it "responds HTTP 404" do
        post :get_token, body: @body.to_json, format: :json
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when provided a invalid password" do
      before :each do
        @body = {
          email: @user1.email,
          password: 'wrong_password'
        }
      end

      it "responds HTTP 401" do
        post :get_token, body: @body.to_json, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when provided a invalid json or not all required inputs" do
      before :each do
        @body = "{
          'email': 'email',
        }"
      end

      it "responds HTTP 400" do
        post :get_token, body: @body, format: :json
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET #create" do
    before :each do
      @body = {
        email: "wrong_email",
        password: @user1_password
      }
    end

    context "when provided a valid inputs" do
      before :each do
        @body = {
          full_name: "name",
          email: "create_test@email.com",
          password: "secret"
        }
      end

      it "responds HTTP 201" do
        post :create, body: @body.to_json, format: :json
        expect(response).to have_http_status(:created)
      end

      it "returns the user that was be created" do
        post :create, body: @body.to_json, format: :json
        user = JSON.parse(response.body)
        expect(user["email"]).to eq @body[:email]
      end
    end

    context "when provided a already registered email" do
      before :each do
        @body = {
          full_name: "Other user 1 name",
          email: @user1.email,
          password: "pass",
        }
      end

      it "responds HTTP 409" do
        post :create, body: @body.to_json, format: :json
        expect(response).to have_http_status(:conflict)
      end
    end

    context "when provided a invalid json or not provided all required inputs" do
      before :each do
        @body = {
          full_name: "name",
          email: "create_test@email.com"
        }
      end

      it "responds HTTP 400" do
        post :create, body: @body.to_json, format: :json
        expect(response).to have_http_status(:bad_request)
      end
    end

  end

end
