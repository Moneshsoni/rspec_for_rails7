require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  describe "Users controller index" do
    context "Index methods" do
      it "Assigns @post" do
        post = Post.create
        get :index
        expect(assigns(:posts)).to eq([post])
      end

      it "Render the index template" do
        get :index
        expect(response).to render_template("index")
      end

      it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
        expect(response.body).to eq ""
      end

      it "renders the posts/index template" do
        get :index
        expect(response).to render_template("posts/index")
        expect(response.body).to eq ""
      end

      it "renders the 'new' template" do
        get :new
        expect(response).to render_template("new")
      end
    end
  end
end