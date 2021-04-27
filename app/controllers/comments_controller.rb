# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_commentable

  def edit; end

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

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: '削除しました'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
