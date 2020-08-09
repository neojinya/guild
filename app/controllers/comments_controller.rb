class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comments = Comment.find(user_id)
  end

  def edit
  end
end
