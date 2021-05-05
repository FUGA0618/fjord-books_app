# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  test 'creating a report' do
    sign_in_as users(:alice)

    visit new_report_path
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
    sign_in_as users(:alice)

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
    sign_in_as users(:alice)

    visit reports_url
    accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
