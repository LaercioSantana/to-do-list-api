class TodoController < ApplicationController
  before_action :authenticate_token
  before_action :find_todo, except: [:index, :create]

=begin
      @api {get} /users/todos Requisitar a lista de to-do de um usuário
      @apiName IndexTodos
      @apiGroup To-do
      @apiPermission user

      @apiUse tokenParam

      @apiError 401 Unauthorized

      @apiSuccessExample Resposta de successo:
          HTTP/1.1 200 OK
          [
            {
              "id": 3,
              "done": false,
              "description": "description todo 2 user 2",
              "priority": 0,
              "created_at": "2017-04-24T15:29:33.774Z",
              "updated_at": "2017-04-24T15:29:33.774Z",
              "user_id": 2
            },
            .
            .
            .
            {
              "id": 10,
              "done": false,
              "description": "description todo 3 user 2",
              "priority": 0,
              "created_at": "2017-04-24T15:29:33.778Z",
              "updated_at": "2017-04-24T15:29:33.778Z",
              "user_id": 2
            }
          ]
=end
  def index
    render json: @user.todos, status: :ok
  end

=begin
      @api {post} /users/tokens Criar um to-do na lista de um usuario.
      @apiName PostTodo
      @apiGroup To-do
      @apiPermission user

      @apiUse tokenParam

      @apiParam {String} description Descrição do to-do.
      @apiParam {Integer} [priority] Prioridade do to-do.
      @apiParam {boolean} [done] Sinaliza se o to-do ja foi feito.

      @apiParam (201 - UserCreated) {Integer} id Id do to-do criado.
      @apiParam (201 - UserCreated) {String} description Descrição do to-do criado.
      @apiParam (201 - UserCreated) {Integer} priority Prioridade do to-do criado. Padrão é 0.
      @apiParam (201 - UserCreated) {boolean} done Flag de 'feito' do to-do criado.
      @apiUse created_at
      @apiUse updated_at

      @apiError 401 Unauthorized
      @apiUse invalidJson

      @apiParamExample {json} Exemplo de requisição:
        {
          "description": "todo example",
          "priority": 0,
          "done": true
        }
      @apiSuccessExample Exemplo de resposta com sucesso:
          HTTP/1.1 201 CREATED
          {
            "id": 7,
            "full_name": "llawliet",
            "email": "llawliet@email.com",
            "created_at": "2017-04-26T01:09:05.880Z",
            "updated_at": "2017-04-26T01:09:05.880Z",
            "token": "WBMkNZyyDDYCPn4prA7riPjG"
          }

      @apiUse badResquestExemple
=end

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

=begin
      @api {get} /users/tokens/:todo Requisita um to-do da lista de to-do do usuario.
      @apiName GetTodo
      @apiGroup To-do
      @apiPermission user

      @apiUse tokenParam

      @apiParam (ParamURL) {String} :todo Id do to-do requisitado.

      @apiParam (201 - UserCreated) {Integer} id Id do to-do criado.
      @apiParam (201 - UserCreated) {String} description Descrição do to-do criado.
      @apiParam (201 - UserCreated) {Integer} priority Prioridade do to-do criado. Padrão é 0.
      @apiParam (201 - UserCreated) {boolean} done Flag de 'feito' do to-do criado.
      @apiUse created_at
      @apiUse updated_at

      @apiError 401 Unauthorized

      @apiSuccessExample Exemplo de resposta com sucesso:
          HTTP/1.1 201 CREATED
          {
            "id": 7,
            "full_name": "llawliet",
            "email": "llawliet@email.com",
            "created_at": "2017-04-26T01:09:05.880Z",
            "updated_at": "2017-04-26T01:09:05.880Z",
            "token": "WBMkNZyyDDYCPn4prA7riPjG"
          }

      @apiUse not_found_todo
      @apiUse badResquestExemple
=end
  def get
    render json: @todo, status: :ok
  end

=begin
      @api {delete} /users/tokens/:todo Deleta um to-do da lista de to-do do usuario.
      @apiName DeleteTodo
      @apiGroup To-do
      @apiPermission user

      @apiUse tokenParam

      @apiParam (ParamURL) {String} :todo Id do to-do a ser deletado.

      @apiParam (201 - UserCreated) {Integer} id Id do to-do deletado.
      @apiParam (201 - UserCreated) {String} description Descrição do to-do deletado.
      @apiParam (201 - UserCreated) {Integer} priority Prioridade do to-do deletado. Padrão é 0.
      @apiParam (201 - UserCreated) {boolean} done Flag de 'feito' do to-do deletado.
      @apiUse created_at
      @apiUse updated_at

      @apiError 401 Unauthorized

      @apiSuccessExample Exemplo de resposta com sucesso:
          HTTP/1.1 200 OK
          {
            "id": 7,
            "full_name": "llawliet",
            "email": "llawliet@email.com",
            "created_at": "2017-04-26T01:09:05.880Z",
            "updated_at": "2017-04-26T01:09:05.880Z",
            "token": "WBMkNZyyDDYCPn4prA7riPjG"
          }

      @apiUse not_found_todo
      @apiUse badResquestExemple
=end

  def delete
    render json: @todo.destroy, status: :ok
  end

=begin
      @api {put} /users/tokens/:todo Altera um to-do da lista de um usuario.
      @apiName ChangeTodo
      @apiGroup To-do
      @apiPermission user

      @apiUse tokenParam

      @apiParam (ParamURL) {String} :todo Id do to-do a ser alterado.

      @apiParam {String} [description] Descrição do to-do.
      @apiParam {Integer} [priority] Prioridade do to-do.
      @apiParam {boolean} [done] Sinaliza se o to-do ja foi feito.

      @apiError 401 Unauthorized
      @apiUse invalidJson

      @apiParamExample {json} Exemplo de requisição:
        {
          "done": false
        }
      @apiSuccessExample Exemplo de resposta com sucesso:
          HTTP/1.1 201 CREATED
          {
            "user_id": 2,
            "done": false,
            "id": 7,
            "description": "todo example",
            "priority": 0,
            "created_at": "2017-04-26T02:03:03.407Z",
            "updated_at": "2017-04-26T02:10:10.964Z"
          }

      @apiUse not_found_todo
      @apiUse badResquestExemple
=end

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
##
# Doc mixins
##
=begin
@apiDefine not_found_todo
@apiErrorExample Exemplo de resposta com error:
    HTTP/1.1 404 NOT FOUND
    {
      "error": "To-do not found"
    }
=end
