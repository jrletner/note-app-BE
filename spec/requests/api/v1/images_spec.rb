require "swagger_helper"

RSpec.describe "api/v1/images", type: :request do
  #create image
  path "/api/v1/images/create" do
    post("create image") do
      description "Create a new image"
      tags "IMAGES"
      security [bearer_auth: []]
      parameter name: :create, in: :body, schema: {
                  type: "object",
                  properties: {
                    image_path: { type: "string" },
                    link_name: { type: "string" },
                    notes_id: { type: "number" },
                  },
                }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  #show single image
  path "/api/v1/images/show" do
    get("show image") do
      description "Get a single image"
      tags "IMAGES"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the image",
                }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  #delete image
  path "/api/v1/images/destroy" do
    delete("delete image") do
      description "Delete a image"
      tags "IMAGES"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the image",
                }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  #show all images
  path "/api/v1/images/index" do
    get("list images") do
      description "Get all images"
      tags "IMAGES"
      security [bearer_auth: []]
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  #update images
  path "/api/v1/images/update" do
    put("update image") do
      description "Update a iamge"
      tags "IMAGES"
      security [bearer_auth: []]
      parameter name: :update, in: :body, schema: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    image_path: { type: "string" },
                    link_name: { type: "string" },
                  },
                }
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
end
