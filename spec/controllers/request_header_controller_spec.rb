require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  controller do
    def show
      if request.headers["Authorization"] == "foo"
        head :ok
      else
        head :forbidden
      end
    end
  end

  before do
    routes.draw { get "show" => "anonymous#show" }
  end

  context "valid Authorization header" do
    it "returns a 200" do
      request.headers["Authorization"] = "foo"

      get :show

      expect(response).to have_http_status(:ok)
    end
  end

  context "invalid Authorization header" do
  
    it "returns a 403" do
      request.headers["Authorization"] = "bar"

      get :show

      expect(response).to have_http_status(:forbidden)
    end
  end
end