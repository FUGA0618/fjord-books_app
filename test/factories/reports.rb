# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { '日報を作成しました。' }
    content { '今日はJavaScriptについて勉強しました。' }
    user factory: :alice
  end
end
