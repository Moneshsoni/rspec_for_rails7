require "rails_helper"

RSpec.describe Post, type: :model do
  describe "Working with associations" do
    context "with 2 or more comments" do
      it "orders them in reverse chronologically" do
        post = Post.create!
        comment1 = post.comments.create!(:body => "first comment")
        comment2 = post.comments.create!(:body => "second comment")
        expect(post.reload.comments).to eq([comment1, comment2])
      end
    end

    context "with record count" do
      it "Should check post created or not" do
        expect(Post.count).to eq 0
      end

      it "Should check post create count" do 
        Post.create
        expect(Post.count).to eq 1
      end

      # it "Should check last craete post count showing" do
      #   expect(Post.count).to eq 1
      # end

      it "has none after one was created in a previous example" do
        expect(Post.count).to eq 0
      end
    end
  end
end