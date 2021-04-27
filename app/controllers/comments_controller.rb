# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to @commentable, notice: 'コメントしました'
    else
      resource = request.path.split('/')[1]
      eval("@#{resource.singularize} = @commentable") # rubocop:disable all
      render "#{resource}/show"
    end
  end

  def update; end

  def destroy; end

  private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
