class UserController < ApplicationController
  before_action :authenticate_token, except: [:create, :get_token]

  def get
    render json: @user, status: :ok
  end

  def get_token
    if not validate_json "/user/authenticate.json", @json
      error_response :bad_json
    elsif !(@user = User.find_by_email(@json["email"]))
      error_response "Email not found", :not_found
    elsif !@user.authenticate(@json["password"])
      error_response :unauthorized
    else
      render json: {token: @user.token}, status: :ok
    end
  end

  def create
    if not validate_json "/user/create.json", @json
      error_response :bad_json
    elsif User.find_by_email(@json["email"])
      error_response :conflict
    else
      @user = User.new
      @user.assign_attributes @json
      if @user.save
        user = @user.attributes.except("password_digest")
        render json: user, status: :created
      else
        error_response "Some invalid input", :bad_request
      end
    end
  end
end
