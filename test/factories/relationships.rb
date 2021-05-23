# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    following factory: :carol
    follower factory: :dave
  end
end
