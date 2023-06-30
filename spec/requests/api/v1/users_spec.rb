require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
#login user
  path '/api/v1/users/login' do

    post('login user') do
      description "Login a user"
      tags "USERS"
      parameter name: :login, in: :body, schema: {
        type: "object",
        properties: {
          email: {type: "string"},
          password: {type: "string"}
        },
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  #create a user
  path '/api/v1/users/create' do
    post('create user') do
      description "Create a user"
      tags "USERS"
      parameter name: :create, in: :body, schema: {
        type: "object",
        properties: {
          email: { type: "string" },
          password: { type: "string" },
        },
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  #user show
  path '/api/v1/users/me' do
    get('me user') do
      description "Get User"
      tags "USERS"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
        type: "integer",
        description: "ID of the user",
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  #logout user
  path '/api/v1/users/logout' do
    delete('logout user') do
      description "logout user"
      tags "USERS"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
        email:  {type: "string"},
        password: {type: "string"}
      }
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
