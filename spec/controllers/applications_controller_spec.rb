require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  controller do
    def clear_cookie
      cookies.delete(:user_name)
      head :ok
    end

    def index
      redirect_to login_url
    end

  end

  before do
    routes.draw { get "clear_cookie" => "anonymous#clear_cookie" }
  end

  it "clear cookie's value 'user_name'" do
    cookies[:user_name] = "Sam"

    get :clear_cookie

    expect(cookies[:user_name]).to eq nil
  end

  # it "redirects to the login page" do
  #   get :index
  #   expect(response).to redirect_to("/login")
  # end
end



# Rails.application.routes.draw do
#   match "/login" => "sessions#new", :as => "login", :via => "get"
# end


# RSpec.describe ApplicationController, type: :controller do
#   controller do
#     def index
#       redirect_to login_url
#     end
#   end

#   it "redirects to the login page" do
#     get :index
#     expect(response).to redirect_to("/login")
#   end
# end