# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = create(:report)
    @alice = @report.user
    @bob = create(:bob)
  end

  test '#editable' do
    assert_not @report.editable?(@bob)
    assert @report.editable?(@alice)
  end

  test '#created_on' do
    @report.created_at = 'Thu, 29 Apr 2021 12:05:26.760615000 JST +09:00'

    assert_equal '2021/04/29', I18n.localize(@report.created_on)
  end
end
