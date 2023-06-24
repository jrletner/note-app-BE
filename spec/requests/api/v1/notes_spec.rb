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
    get("show note") do
      description "Get a single note"
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

  #DELETE A NOTE
  path "/api/v1/notes/destroy" do
    delete("delete note") do
      description "Delete a single note"
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

  #SHOW ALL NOTES
  path "/api/v1/notes/index" do
    get("list notes") do
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
    put("update note") do
      description "Update a single note"
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
end
