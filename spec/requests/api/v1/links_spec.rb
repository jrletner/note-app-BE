require "swagger_helper"

RSpec.describe "api/v1/links", type: :request do
  #create a new link
  path "/api/v1/links/create" do
    post("create link") do
      description "Create a link"
      tags "LINKS"
      security [bearer_auth: []]
      parameter name: :create, in: :body, schema: {
                  type: "object",
                  properties: {
                    link: { type: "string" },
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

  #show one link
  path "/api/v1/links/show" do
    get("show link") do
      response(200, "successful") do
        description "Get a single note"
        tags "LINKS"
        security [bearer_auth: []]
        parameter name: :id, in: :query, required: true, schema: {
                    type: "integer",
                    description: "ID of the link",
                  }
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

  #delete link
  path "/api/v1/links/destroy" do
    delete("delete link") do
      response(200, "successful") do
        description "Delete a single link"
        tags "LINKS"
        security [bearer_auth: []]
        parameter name: :id, in: :query, required: true, schema: {
                    type: "integer",
                    description: "ID of the link",
                  }
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

  #show all links
  path "/api/v1/links/index" do
    get("list links") do
      response(200, "successful") do
        description "Get all links"
        tags "LINKS"
        security [bearer_auth: []]
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

  #update link
  path "/api/v1/links/update" do
    put("update link") do
      response(200, "successful") do
        description "Update a single link"
        tags "LINKS"
        security [bearer_auth: []]
        parameter name: :update, in: :body, schema: {
                    type: "object",
                    properties: {
                      id: { type: "number" },
                      link: { type: "string" },
                      link_name: { type: "string" },
                    },
                  }
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
