require "swagger_helper"

RSpec.describe "api/v1/notes", type: :request do

  #CREATE NOTE
  path "/api/v1/notes/create" do
    post("create note") do
      description "Create a new note"
      tags "NOTES"
      security [bearer_auth: []]
      parameter name: :create, in: :body, schema: {
                  type: "object",
                  properties: {
                    title: { type: "string" },
                    description: { type: "string" },
                    user_id: { type: "number" },
                    child_category_id: {type: "number" }
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

  #SHOW A SINGLE NOTE
  path "/api/v1/notes/show" do
    get("show single note") do
      description "Get a single note"
      tags "NOTES"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the note",
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

  #DELETE A NOTE
  path "/api/v1/notes/destroy" do
    delete("delete single note") do
      description "Delete a single note"
      tags "NOTES"
      security [bearer_auth: []]
      parameter name: :id, in: :query, required: true, schema: {
                  type: "integer",
                  description: "ID of the note",
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

  #SHOW ALL NOTES
  path "/api/v1/notes/index" do
    get("show all notes") do
      description "Get all notes"
      tags "NOTES"
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

  #UPDATE A NOTE
  path "/api/v1/notes/update" do
    put("update single note") do
      description "Update a single note"
      tags "NOTES"
      security [bearer_auth: []]
      parameter name: :update, in: :body, schema: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    title: { type: "string" },
                    description: { type: "string" },
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
