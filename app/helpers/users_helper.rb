# frozen_string_literal: true

module UsersHelper
  def split_and_display_zip(zip)
    return if zip.nil?

    str_zip = zip.to_s
    "#{str_zip.slice(0..2)}-#{str_zip.slice(3..6)}"
  end
end
