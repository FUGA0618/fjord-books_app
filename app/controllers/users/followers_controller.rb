# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  PAGINATES_PER = 10

  def index
    @followers = User.find(params[:user_id]).followers.with_attached_avatar.page(params[:page]).per(PAGINATES_PER)
  end
end
