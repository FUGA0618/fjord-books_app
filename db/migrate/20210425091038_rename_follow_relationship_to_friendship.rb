# frozen_string_literal: true

class RenameFollowRelationshipToFriendship < ActiveRecord::Migration[6.1]
  def change
    rename_table :follow_relationships, :friendships
  end
end
