# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  PAGINATES_PER = 10

  def index
    @following_users = User.find(params[:user_id]).followings.with_attached_avatar.page(params[:page]).per(PAGINATES_PER)
  end
end
