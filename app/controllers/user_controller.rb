class UserController < ApplicationController

  def get
    render json: User.find_by_id(params[:user]), status: :ok
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
