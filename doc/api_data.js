define({ "api": [
  {
    "type": "put",
    "url": "/users/tokens/:todo",
    "title": "Altera um to-do da lista de um usuario.",
    "name": "ChangeTodo",
    "group": "To_do",
    "permission": [
      {
        "name": "user"
      }
    ],
    "parameter": {
      "fields": {
        "ParamURL": [
          {
            "group": "ParamURL",
            "type": "String",
            "optional": false,
            "field": ":todo",
            "description": "<p>Id do to-do a ser alterado.</p>"
          }
        ],
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": true,
            "field": "description",
            "description": "<p>Descrição do to-do.</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": true,
            "field": "priority",
            "description": "<p>Prioridade do to-do.</p>"
          },
          {
            "group": "Parameter",
            "type": "boolean",
            "optional": true,
            "field": "done",
            "description": "<p>Sinaliza se o to-do ja foi feito.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de requisição:",
          "content": "{\n  \"done\": false\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>Unauthorized</p>"
          },
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "400",
            "description": "<p>Bad request.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de resposta com error:",
          "content": "HTTP/1.1 404 NOT FOUND\n{\n  \"error\": \"To-do not found\"\n}",
          "type": "json"
        },
        {
          "title": "Exemplo de resposta com erro no json da requisição:",
          "content": "HTTP/1.1 400 BAD REQUEST\n{\n  \"error\": \"Bad json\"\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de resposta com sucesso:",
          "content": "HTTP/1.1 201 CREATED\n{\n  \"user_id\": 2,\n  \"done\": false,\n  \"id\": 7,\n  \"description\": \"todo example\",\n  \"priority\": 0,\n  \"created_at\": \"2017-04-26T02:03:03.407Z\",\n  \"updated_at\": \"2017-04-26T02:10:10.964Z\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/todo_controller.rb",
    "groupTitle": "To_do",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Token",
            "description": "<p>Token do usuario que realizara a ação.</p>"
          }
        ]
      }
    }
  },
  {
    "type": "delete",
    "url": "/users/tokens/:todo",
    "title": "Deleta um to-do da lista de to-do do usuario.",
    "name": "DeleteTodo",
    "group": "To_do",
    "permission": [
      {
        "name": "user"
      }
    ],
    "parameter": {
      "fields": {
        "ParamURL": [
          {
            "group": "ParamURL",
            "type": "String",
            "optional": false,
            "field": ":todo",
            "description": "<p>Id do to-do a ser deletado.</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id do to-do deletado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "description",
            "description": "<p>Descrição do to-do deletado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "priority",
            "description": "<p>Prioridade do to-do deletado. Padrão é 0.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "boolean",
            "optional": false,
            "field": "done",
            "description": "<p>Flag de 'feito' do to-do deletado.</p>"
          }
        ]
      }
    },
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>Unauthorized</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "created_at",
            "description": "<p>Data de criação.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "updated_at",
            "description": "<p>Data da ultima atualização.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de resposta com error:",
          "content": "HTTP/1.1 404 NOT FOUND\n{\n  \"error\": \"To-do not found\"\n}",
          "type": "json"
        },
        {
          "title": "Exemplo de resposta com erro no json da requisição:",
          "content": "HTTP/1.1 400 BAD REQUEST\n{\n  \"error\": \"Bad json\"\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de resposta com sucesso:",
          "content": "HTTP/1.1 200 OK\n{\n  \"id\": 7,\n  \"full_name\": \"llawliet\",\n  \"email\": \"llawliet@email.com\",\n  \"created_at\": \"2017-04-26T01:09:05.880Z\",\n  \"updated_at\": \"2017-04-26T01:09:05.880Z\",\n  \"token\": \"WBMkNZyyDDYCPn4prA7riPjG\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/todo_controller.rb",
    "groupTitle": "To_do",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Token",
            "description": "<p>Token do usuario que realizara a ação.</p>"
          }
        ]
      }
    }
  },
  {
    "type": "get",
    "url": "/users/tokens/:todo",
    "title": "Requisita um to-do da lista de to-do do usuario.",
    "name": "GetTodo",
    "group": "To_do",
    "permission": [
      {
        "name": "user"
      }
    ],
    "parameter": {
      "fields": {
        "ParamURL": [
          {
            "group": "ParamURL",
            "type": "String",
            "optional": false,
            "field": ":todo",
            "description": "<p>Id do to-do requisitado.</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id do to-do criado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "description",
            "description": "<p>Descrição do to-do criado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "priority",
            "description": "<p>Prioridade do to-do criado. Padrão é 0.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "boolean",
            "optional": false,
            "field": "done",
            "description": "<p>Flag de 'feito' do to-do criado.</p>"
          }
        ]
      }
    },
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>Unauthorized</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "created_at",
            "description": "<p>Data de criação.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "updated_at",
            "description": "<p>Data da ultima atualização.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de resposta com error:",
          "content": "HTTP/1.1 404 NOT FOUND\n{\n  \"error\": \"To-do not found\"\n}",
          "type": "json"
        },
        {
          "title": "Exemplo de resposta com erro no json da requisição:",
          "content": "HTTP/1.1 400 BAD REQUEST\n{\n  \"error\": \"Bad json\"\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de resposta com sucesso:",
          "content": "HTTP/1.1 201 CREATED\n{\n  \"id\": 7,\n  \"full_name\": \"llawliet\",\n  \"email\": \"llawliet@email.com\",\n  \"created_at\": \"2017-04-26T01:09:05.880Z\",\n  \"updated_at\": \"2017-04-26T01:09:05.880Z\",\n  \"token\": \"WBMkNZyyDDYCPn4prA7riPjG\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/todo_controller.rb",
    "groupTitle": "To_do",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Token",
            "description": "<p>Token do usuario que realizara a ação.</p>"
          }
        ]
      }
    }
  },
  {
    "type": "get",
    "url": "/users/todos",
    "title": "Requisitar a lista de to-do de um usuário",
    "name": "IndexTodos",
    "group": "To_do",
    "permission": [
      {
        "name": "user"
      }
    ],
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>Unauthorized</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Resposta de successo:",
          "content": "HTTP/1.1 200 OK\n[\n  {\n    \"id\": 3,\n    \"done\": false,\n    \"description\": \"description todo 2 user 2\",\n    \"priority\": 0,\n    \"created_at\": \"2017-04-24T15:29:33.774Z\",\n    \"updated_at\": \"2017-04-24T15:29:33.774Z\",\n    \"user_id\": 2\n  },\n  .\n  .\n  .\n  {\n    \"id\": 10,\n    \"done\": false,\n    \"description\": \"description todo 3 user 2\",\n    \"priority\": 0,\n    \"created_at\": \"2017-04-24T15:29:33.778Z\",\n    \"updated_at\": \"2017-04-24T15:29:33.778Z\",\n    \"user_id\": 2\n  }\n]",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/todo_controller.rb",
    "groupTitle": "To_do",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Token",
            "description": "<p>Token do usuario que realizara a ação.</p>"
          }
        ]
      }
    }
  },
  {
    "type": "post",
    "url": "/users/tokens",
    "title": "Criar um to-do na lista de um usuario.",
    "name": "PostTodo",
    "group": "To_do",
    "permission": [
      {
        "name": "user"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "description",
            "description": "<p>Descrição do to-do.</p>"
          },
          {
            "group": "Parameter",
            "type": "Integer",
            "optional": true,
            "field": "priority",
            "description": "<p>Prioridade do to-do.</p>"
          },
          {
            "group": "Parameter",
            "type": "boolean",
            "optional": true,
            "field": "done",
            "description": "<p>Sinaliza se o to-do ja foi feito.</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id do to-do criado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "description",
            "description": "<p>Descrição do to-do criado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "priority",
            "description": "<p>Prioridade do to-do criado. Padrão é 0.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "boolean",
            "optional": false,
            "field": "done",
            "description": "<p>Flag de 'feito' do to-do criado.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de requisição:",
          "content": "{\n  \"description\": \"todo example\",\n  \"priority\": 0,\n  \"done\": true\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>Unauthorized</p>"
          },
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "400",
            "description": "<p>Bad request.</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "created_at",
            "description": "<p>Data de criação.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "updated_at",
            "description": "<p>Data da ultima atualização.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de resposta com erro no json da requisição:",
          "content": "HTTP/1.1 400 BAD REQUEST\n{\n  \"error\": \"Bad json\"\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de resposta com sucesso:",
          "content": "HTTP/1.1 201 CREATED\n{\n  \"id\": 7,\n  \"full_name\": \"llawliet\",\n  \"email\": \"llawliet@email.com\",\n  \"created_at\": \"2017-04-26T01:09:05.880Z\",\n  \"updated_at\": \"2017-04-26T01:09:05.880Z\",\n  \"token\": \"WBMkNZyyDDYCPn4prA7riPjG\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/todo_controller.rb",
    "groupTitle": "To_do",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Token",
            "description": "<p>Token do usuario que realizara a ação.</p>"
          }
        ]
      }
    }
  },
  {
    "type": "get",
    "url": "/users",
    "title": "Requisitar um usuario",
    "name": "GetUser",
    "group": "Users",
    "permission": [
      {
        "name": "user"
      }
    ],
    "parameter": {
      "fields": {
        "200 - Success": [
          {
            "group": "200 - Success",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id do usuario criado.</p>"
          },
          {
            "group": "200 - Success",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>Nome do usuario criado.</p>"
          },
          {
            "group": "200 - Success",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>Email do usuario criado. Este email é unico para cada usuário.</p>"
          },
          {
            "group": "200 - Success",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": "<p>Token do usuario criado.</p>"
          }
        ]
      }
    },
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>Unauthorized</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "created_at",
            "description": "<p>Data de criação.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "updated_at",
            "description": "<p>Data da ultima atualização.</p>"
          }
        ]
      }
    },
    "header": {
      "examples": [
        {
          "title": "Exemplo de Header:",
          "content": "{\"Token\": \"WBMkNZyyDDYCPn4prA7riPjG\"}",
          "type": "Json"
        }
      ],
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "Token",
            "description": "<p>Token do usuario que realizara a ação.</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de respota com sucesso:",
          "content": " HTTP/1.1 200 OK\n{\n  \"id\": 7,\n  \"full_name\": \"llawliet\",\n  \"email\": \"llawliet@email.com\",\n  \"created_at\": \"2017-04-26T01:09:05.880Z\",\n  \"updated_at\": \"2017-04-26T01:09:05.880Z\",\n  \"token\": \"WBMkNZyyDDYCPn4prA7riPjG\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/user_controller.rb",
    "groupTitle": "Users"
  },
  {
    "type": "post",
    "url": "/users/tokens/get",
    "title": "Adquirir um token",
    "name": "PostToken",
    "group": "Users",
    "permission": [
      {
        "name": "none"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>Email do usuario que pertencerá o token.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>A senha do usuário que pertencerá o token.</p>"
          }
        ],
        "200 - Success": [
          {
            "group": "200 - Success",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": "<p>Token requisitado.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de requisição:",
          "content": " {\n  \"email\": \"llawliet@email.com\",\n  \"password\": \"pass\",\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "fields": {
        "401 - InvalidCredentials": [
          {
            "group": "401 - InvalidCredentials",
            "type": "json",
            "optional": false,
            "field": "root",
            "description": "<p>Senha errada.</p>"
          }
        ],
        "404 - NotFound": [
          {
            "group": "404 - NotFound",
            "type": "json",
            "optional": false,
            "field": "root",
            "description": "<p>Email não cadastrado.</p>"
          }
        ],
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "400",
            "description": "<p>Bad request.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de resposta com erro no json da requisição:",
          "content": "HTTP/1.1 400 BAD REQUEST\n{\n  \"error\": \"Bad json\"\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de respota com sucesso:",
          "content": "HTTP/1.1 200 OK\n{\n   \"token\":\"WBMkNZyyDDYCPn4prA7riPjG\"\n}",
          "type": "json"
        },
        {
          "title": "Exemplo de resposta a senha errada:",
          "content": "HTTP/1.1 401 UNAUTHORIZED\n{\n  \"error\": \"Unauthorized or wrong credentials\"\n}",
          "type": "json"
        },
        {
          "title": "Exemplo de resposta a email não cadastrado:",
          "content": "HTTP/1.1 404 NOT FOUND\n{\n  \"error\": \"Email not found\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/user_controller.rb",
    "groupTitle": "Users"
  },
  {
    "type": "post",
    "url": "/users",
    "title": "Registrar um usuário",
    "name": "PostUsers",
    "group": "Users",
    "permission": [
      {
        "name": "none"
      }
    ],
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "full_name",
            "description": "<p>Nome do usuario a ser criado.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>Email do usuario a ser criado. Este email é unico para cada usuário.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>A senha do usuário a ser criado. É permitido todos os tipos de caracteres.</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "Integer",
            "optional": false,
            "field": "id",
            "description": "<p>Id do usuario criado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>Nome do usuario criado.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>Email do usuario criado. Este email é unico para cada usuário.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "token",
            "description": "<p>Token do usuario criado.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de requisição:",
          "content": "{\n \"full_name\": \"llawliet\",\n \"email\": \"llawliet@email.com\",\n \"password\": \"pass\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "fields": {
        "409 - ExistingEmail": [
          {
            "group": "409 - ExistingEmail",
            "type": "json",
            "optional": false,
            "field": "root",
            "description": "<p>Já existe um usuário com este email.</p>"
          }
        ],
        "201 - UserCreated": [
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "created_at",
            "description": "<p>Data de criação.</p>"
          },
          {
            "group": "201 - UserCreated",
            "type": "String",
            "optional": false,
            "field": "updated_at",
            "description": "<p>Data da ultima atualização.</p>"
          }
        ],
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "400",
            "description": "<p>Bad request.</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Exemplo de resposta com email em uso:",
          "content": "HTTP/1.1 409 CONFLICT\n{\n  \"error\": \"The resource already exists\"\n}",
          "type": "json"
        },
        {
          "title": "Exemplo de resposta com erro no json da requisição:",
          "content": "HTTP/1.1 400 BAD REQUEST\n{\n  \"error\": \"Bad json\"\n}",
          "type": "json"
        }
      ]
    },
    "success": {
      "examples": [
        {
          "title": "Exemplo de resposta com sucesso:",
          "content": "HTTP/1.1 201 CREATED\n{\n  \"id\": 7,\n  \"full_name\": \"llawliet\",\n  \"email\": \"llawliet@email.com\",\n  \"created_at\": \"2017-04-26T01:09:05.880Z\",\n  \"updated_at\": \"2017-04-26T01:09:05.880Z\",\n  \"token\": \"WBMkNZyyDDYCPn4prA7riPjG\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/user_controller.rb",
    "groupTitle": "Users"
  }
] });