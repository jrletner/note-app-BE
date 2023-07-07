require 'swagger_helper'

RSpec.describe 'api/v1/child_categories', type: :request do

  #CREATE CHILD CATEGORY
  path '/api/v1/child_categories/create' do
    post('create child_category') do
      description "Create a new child category"
      tags "CHILD CATEGORY"
      security [bearer_auth: []]
      parameter name: :create, in: :body, schema: {
        type: "object",
        properties: {
          title: { type: "string"},
          parent_categories_id: { type: "number"}}}

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
# show a single child category
  path '/api/v1/child_categories/show' do

    get('show child_category') do
      description "Get a single child category"
      tags "CHILD CATEGORY"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
        type: "integer",
        description: "ID of the child category"}
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
# delete a single child category
  path '/api/v1/child_categories/destroy' do

    delete('delete child_category') do
      description "Get a single child category"
      tags "CHILD CATEGORY"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
        type: "integer",
        description: "ID of the child category"}

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

  path '/api/v1/child_categories/index' do

    put('list child_categories') do
      description "Show All"
      tags "CHILD CATEGORY"
      security [bearer_auth: []]

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
# update a single child category
  path '/api/v1/child_categories/update' do

    put('update child_category') do
      description "Create a new child category"
      tags "CHILD CATEGORY"
      security [bearer_auth: []]
      parameter name: :update, in: :body, schema: {
        type: "object",
        properties: {
          id: { type: "integer"},
          title: { type: "string"},
          }}
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
