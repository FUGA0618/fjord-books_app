# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = create(:alice)
    @book = create(:jojo)
    sign_in_as @user
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    within 'form' do
      fill_in 'book[title]', with: '呪術廻戦'
      fill_in 'book[memo]', with: 'めちゃくちゃおもしろい！'
      fill_in 'book[author]', with: '芥見下々'
      click_on '登録する'
    end

    assert_text '本が作成されました。'
    assert_text '呪術廻戦'
    assert_text 'めちゃくちゃおもしろい！'
    assert_text '芥見下々'
  end

  test 'showing a Book' do
    visit books_url
    click_on '詳細'

    assert_selector 'h1', text: '本の詳細'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    within 'form' do
      fill_in 'book[title]', with: '金持ち父さん貧乏父さん'
      fill_in 'book[memo]', with: 'お金の教科書'
      fill_in 'book[author]', with: 'ロバート・キヨサキ'
      click_on '更新する'
    end

    assert_text '本が更新されました。'
    assert_text '金持ち父さん貧乏父さん'
    assert_text 'お金の教科書'
    assert_text 'ロバート・キヨサキ'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
