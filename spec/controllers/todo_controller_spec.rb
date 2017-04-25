require 'rails_helper'

RSpec.describe TodoController, type: :controller do
  before :each do
    @user1 = User.create full_name: "test user1", email: "test_user1@email.com", password: "secret1"

    @todo1 = @user1.todos.create description: "todo 1 user 1"
    @todo2 = @user1.todos.create description: "todo 2 user 1"
  end

  describe "GET #index" do

    it "responds HTTP 401 when provided a empty token" do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it "responds HTTP 401 when provided a invalid token" do
      request.headers["Token"] = '12'
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    context "when provided a valid user token" do
      it "responds HTTP 200" do
        request.headers["Token"] = @user1.token
        get :index
        expect(response).to have_http_status(:ok)
      end


      it "return the to-do list" do
        request.headers["Token"] = @user1.token
        get :index
        todos = JSON.parse(response.body)
        expect(todos[0]["id"]).to eq @user1.todos.all[0].id
        expect(todos[1]["id"]).to eq @user1.todos.all[1].id
      end
    end
  end

  describe "GET #get" do
    before :each do
      @params = {
        todo: @todo1.id
      }
    end

    it "responds HTTP 401 when provided a empty token" do
      get :get, params: @params
      expect(response).to have_http_status(:unauthorized)
    end

    it "responds HTTP 401 when provided a invalid token" do
      request.headers["Token"] = '12'
      get :get, params: @params
      expect(response).to have_http_status(:unauthorized)
    end

    context "when provided a valid todo id in params" do

        it "responds HTTP 200" do
          request.headers["Token"] = @user1.token
          get :get, params: @params
          expect(response).to have_http_status(:ok)
        end

        it "return the to-do" do
          request.headers["Token"] = @user1.token
          get :get, params: @params
          todo = JSON.parse(response.body)
          expect(todo["id"]).to eq @todo1.id
        end
    end

    context "when provided a invalid todo id in params" do
      it "responds HTTP 404" do
        request.headers["Token"] = @user1.token
        get :get, params: { todo: 10 }
        expect(response).to have_http_status(:not_found)
      end
    end

  end

  describe "GET #delete" do
    before :each do
      @params = {
        todo: @todo1.id
      }
    end

    it "responds HTTP 401 when provided a empty token" do
      get :delete, params: @params
      expect(response).to have_http_status(:unauthorized)
    end

    it "responds HTTP 401 when provided a invalid token" do
      request.headers["Token"] = '12'
      get :delete, params: @params
      expect(response).to have_http_status(:unauthorized)
    end

    context "when provided a valid todo id in params" do

        it "responds HTTP 200" do
          request.headers["Token"] = @user1.token
          get :delete, params: @params
          expect(response).to have_http_status(:ok)
        end

        it "remove to-do" do
          request.headers["Token"] = @user1.token
          get :delete, params: @params
          todo = JSON.parse(response.body)
          expect(@user1.todos.find_by_id(todo["id"])).to eq nil
        end

        it "return the to-do removed" do
          request.headers["Token"] = @user1.token
          get :delete, params: @params
          todo = JSON.parse(response.body)
          expect(todo["id"]).to eq @todo1.id
        end

    end

    context "when provided a invalid todo id in params" do
      it "responds HTTP 404" do
        request.headers["Token"] = @user1.token
        get :delete, params: { todo: 10 }
        expect(response).to have_http_status(:not_found)
      end
    end

  end

  describe "POST #create" do
    it "responds HTTP 401 when provided a empty token" do
      post :create
      expect(response).to have_http_status(:unauthorized)
    end

    it "responds HTTP 401 when provided a invalid token" do
      request.headers["Token"] = '12'
      get :create
      expect(response).to have_http_status(:unauthorized)
    end

    context "when provided a valid inputs" do
      before :each do
        @todo_new = {
          description: "todo new"
        }
      end

      it "responds HTTP 201" do
        request.headers["Token"] = @user1.token
        post :create, body: @todo_new.to_json, format: :json
        expect(response).to have_http_status(:created)
      end

      it "returns the to-do that was be created" do
        request.headers["Token"] = @user1.token
        post :create, body: @todo_new.to_json, format: :json
        todo = JSON.parse(response.body)
        expect(todo["description"]).to eq @todo_new[:description]
      end

      it "create the to-do" do
        request.headers["Token"] = @user1.token
        post :create, body: @todo_new.to_json, format: :json
        todo = JSON.parse(response.body)
        expect(todo["description"]).to eq @user1.todos.find_by_id(todo["id"]).description
      end
    end

    context "when provided a invalid json or not provided all required inputs" do
      before :each do
        @body = {
          content: "my todo content",
        }
      end

      it "responds HTTP 400" do
        request.headers["Token"] = @user1.token
        post :create, body: @body.to_json, format: :json
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "GET #change" do
    before :each do
      @params = {
        todo:  @todo1.id
      }
    end

    it "responds HTTP 401 when provided a empty token" do
      get :change, params: @params
      expect(response).to have_http_status(:unauthorized)
    end

    it "responds HTTP 401 when provided a invalid token" do
      request.headers["Token"] = '12'
      get :change, params: @params
      expect(response).to have_http_status(:unauthorized)
    end

    context "when provided a valid todo id in params" do
        before :each do
          # toggle done
          @done = !@user1.todos.find_by_id(@params[:todo]).done
          @body = {done: @done}.to_json
        end

        it "responds HTTP 200" do
          request.headers["Token"] = @user1.token
          get :change, params: @params, body: {}.to_json, format: :json
          expect(response).to have_http_status(:ok)
        end

        it "update to-do" do
          request.headers["Token"] = @user1.token
          get :change, params: @params, body: @body, format: :json
          todo = JSON.parse(response.body)
          expect(@user1.todos.find_by_id(todo["id"]).done).to eq @done
        end

        it "return the to-do updated" do
          request.headers["Token"] = @user1.token
          get :change, params: @params, body: @body
          todo = JSON.parse(response.body)
          expect(todo["id"]).to eq @todo1.id
        end

    end

    context "when provided a invalid todo id in params" do
      it "responds HTTP 404" do
        request.headers["Token"] = @user1.token
        get :change, params: { todo: 10 }
        expect(response).to have_http_status(:not_found)
      end
    end

  end

end
