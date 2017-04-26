class UserController < ApplicationController
  before_action :authenticate_token, except: [:create, :get_token]

=begin
     @api {get} /users Requisitar um usuario
     @apiName GetUser
     @apiGroup Users
     @apiPermission user

     @apiUse tokenParam

     @apiParam (200 - Success) {Integer} id Id do usuario criado.
     @apiParam (200 - Success) {String} name Nome do usuario criado.
     @apiParam (200 - Success) {String} email Email do usuario criado. Este email é unico para cada usuário.
     @apiParam (200 - Success) {String} token Token do usuario criado.
     @apiUse created_at
     @apiUse updated_at

     @apiError 401 Unauthorized

     @apiHeaderExample {Json} Exemplo de Header:
      {"Token": "WBMkNZyyDDYCPn4prA7riPjG"}

     @apiSuccessExample Exemplo de respota com sucesso:
         HTTP/1.1 200 OK
        {
          "id": 7,
          "full_name": "llawliet",
          "email": "llawliet@email.com",
          "created_at": "2017-04-26T01:09:05.880Z",
          "updated_at": "2017-04-26T01:09:05.880Z",
          "token": "WBMkNZyyDDYCPn4prA7riPjG"
        }
=end
  def get
    render json: @user, status: :ok
  end

=begin
      @api {post} /users/tokens/get Adquirir um token
      @apiName PostToken
      @apiGroup Users
      @apiPermission none

      @apiParam {String} email Email do usuario que pertencerá o token.
      @apiParam {String} password A senha do usuário que pertencerá o token.

      @apiParam (200 - Success) {String} token Token requisitado.

      @apiError (401 - InvalidCredentials) {json} root Senha errada.
      @apiError (404 - NotFound) {json} root Email não cadastrado.
      @apiUse invalidJson

      @apiParamExample {json} Exemplo de requisição:
         {
          "email": "llawliet@email.com",
          "password": "pass",
        }
      @apiSuccessExample Exemplo de respota com sucesso:
          HTTP/1.1 200 OK
          {
             "token":"WBMkNZyyDDYCPn4prA7riPjG"
          }
      @apiSuccessExample Exemplo de resposta a senha errada:
          HTTP/1.1 401 UNAUTHORIZED
          {
            "error": "Unauthorized or wrong credentials"
          }
      @apiSuccessExample Exemplo de resposta a email não cadastrado:
          HTTP/1.1 404 NOT FOUND
          {
            "error": "Email not found"
          }

      @apiUse badResquestExemple
=end

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

=begin
      @api {post} /users Registrar um usuário
      @apiName PostUsers
      @apiGroup Users
      @apiPermission none

      @apiParam {String} full_name Nome do usuario a ser criado.
      @apiParam {String} email Email do usuario a ser criado. Este email é unico para cada usuário.
      @apiParam {String} password A senha do usuário a ser criado. É permitido todos os tipos de caracteres.

      @apiParam (201 - UserCreated) {Integer} id Id do usuario criado.
      @apiParam (201 - UserCreated) {String} name Nome do usuario criado.
      @apiParam (201 - UserCreated) {String} email Email do usuario criado. Este email é unico para cada usuário.
      @apiParam (201 - UserCreated) {String} token Token do usuario criado.
      @apiUse created_at
      @apiUse updated_at


      @apiError (409 - ExistingEmail) {json} root Já existe um usuário com este email.
      @apiUse invalidJson

      @apiParamExample {json} Exemplo de requisição:
          {
           "full_name": "llawliet",
           "email": "llawliet@email.com",
           "password": "pass"
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

      @apiErrorExample {json} Exemplo de resposta com email em uso:
      HTTP/1.1 409 CONFLICT
      {
        "error": "The resource already exists"
      }
=end
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
