# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :comment, :comment, presence: true
  validates :comment, :user_id, presence: true
end
