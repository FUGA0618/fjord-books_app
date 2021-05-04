# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable' do
    user = User.create!(email: 'foo@example.com', password: 'password')
    other_user = User.create!(email: 'bar@example.com', password: 'password')
    report = Report.create!(title: '今日の日報', content: '今日はRubyについて学びました。', user_id: user.id)

    assert_not report.editable?(other_user)
    assert report.editable?(user)
  end

  test '#created_on' do
    user = User.create!(email: 'foo@example.com', password: 'password')
    report = Report.create!(title: '今日の日報', content: '今日はRubyについて学びました。', user_id: user.id, created_at: 'Thu, 29 Apr 2021 12:05:26.760615000 JST +09:00')

    assert_equal '2021/04/29', I18n.localize(report.created_on)
  end
end
