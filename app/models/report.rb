# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true

  def created_by?(user)
    self.user == user
  end
end
