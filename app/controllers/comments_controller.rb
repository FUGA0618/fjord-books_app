# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_commentable
  before_action :valid_author, only: %i[edit update destroy]

  def edit; end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      resource = request.path.split('/')[1]
      instance_variable_set("@#{resource.singularize}", @commentable)
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
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def valid_author
    redirect_to @commentable, notice: t('controllers.common.notice_invalid') unless @comment.user == current_user
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
