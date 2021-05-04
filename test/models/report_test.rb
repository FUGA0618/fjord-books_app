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
end
