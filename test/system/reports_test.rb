# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = create(:report)
    sign_in_as @report.user
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    within 'form' do
      fill_in 'report[title]', with: '今日の日報'
      fill_in 'report[content]', with: '今日もよく頑張りました。'
      click_button '登録する'
    end

    assert_text '日報が作成されました。'
    assert_text '今日の日報'
    assert_text '今日もよく頑張りました。'
  end

  test 'updating a book' do
    visit reports_url
    click_on '編集', match: :prefer_exact
    within 'form' do
      fill_in 'report[title]', with: '今日の日報'
      fill_in 'report[content]', with: '今日もよく頑張りました。'
      click_button '更新する'
    end

    assert_text '日報が更新されました。'
    assert_text '今日の日報'
    assert_text '今日もよく頑張りました。'
  end

  test 'destroy a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
