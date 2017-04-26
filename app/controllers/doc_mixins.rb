=begin
   @apiDefine tokenParam
   @apiHeader {String} Token Token do usuario que realizara a ação.
=end
=begin
 @apiDefine invalidJson
  @apiError 400 Bad request.
=end
=begin
 @apiDefine created_at
  @apiError (201 - UserCreated) {String} created_at Data de criação.
=end
=begin
 @apiDefine updated_at
  @apiError (201 - UserCreated) {String} updated_at Data da ultima atualização.
=end
=begin
  @apiDefine badResquestExemple
  @apiErrorExample {json} Exemplo de resposta com erro no json da requisição:
  HTTP/1.1 400 BAD REQUEST
  {
    "error": "Bad json"
  }
=end
