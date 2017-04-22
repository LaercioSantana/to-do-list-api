class TodoController < ApplicationController
  before_action :authenticate_token
  before_action :find_todo, except: [:index, :create]

  def index
    render json: @user.todos, status: :ok
  end

  def create
    if not validate_json "/todo/create.json", @json
      error_response :bad_json
    else
      @todo = @user.todos.create
      @todo.assign_attributes @json
      if @todo.save
        render json: @todo, status: :created
      else
        error_response "Some invalid input", :bad_request
      end
    end
  end

  def get
    render json: @todo, status: :ok
  end

  def delete
    render json: @todo.destroy, status: :ok
  end

  def change
    if not validate_json "/todo/change.json", @json
      error_response :bad_json
    else
      @todo.assign_attributes @json
      if @todo.save
        render json: @todo, status: :ok
      else
        error_response "Some invalid input", :bad_request
      end
    end
  end

  private
    def find_todo
      @todo = @user.todos.find_by_id params[:todo]
      error_response "To-do not found", :not_found if not @todo
    end
end
