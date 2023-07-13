require 'swagger_helper'

RSpec.describe 'api/v1/parent_categories', type: :request do
# create a parent category
  path '/api/v1/parent_categories/create' do

    post('create parent_category') do
      description "Create a new parent category"
      tags "PARENT CATEGORY"
      security [bearer_auth: []]
      parameter name: :create, in: :body, schema: {
        type: "object",
        properties: {
          title: { type: "string"},
          user_id: { type: "number"}}}
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
  # show a single parent category
  path '/api/v1/parent_categories/show' do

    get('show parent_category') do
      description "Get a single parent category"
      tags "PARENT CATEGORY"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
        type: "integer",
        description: "ID of the parent category"}

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
# delte single parent category
  path '/api/v1/parent_categories/destroy' do

    delete('delete parent_category') do
      description "Delete a single parent category"
      tags "PARENT CATEGORY"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
        type: "integer",
        description: "ID of the parent category"}

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
# show all parent categories
  path '/api/v1/parent_categories/index' do

    put('list parent_categories') do
      description "Show All"
      tags "PARENT CATEGORY"
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
# update a single parent category
  path '/api/v1/parent_categories/update' do

    put('update parent_category') do
      description "Update a new parent category"
      tags "PARENT CATEGORY"
      security [bearer_auth: []]
      parameter name: :update, in: :body, schema: {
        type: "object",
        properties: {
          id: { type: "number"},
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
