# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @following_users = User.find(params[:user_id]).followings.with_attached_avatar.page(params[:page]).per(10)
  end
end
