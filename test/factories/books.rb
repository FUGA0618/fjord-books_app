# frozen_string_literal: true

FactoryBot.define do
  factory :jojo, class: Book do
    title { 'ジョジョの奇妙な冒険' }
    memo { 'そこにシビれる！あこがれるゥ！！' }
    author { '荒木飛呂彦' }
  end
end
