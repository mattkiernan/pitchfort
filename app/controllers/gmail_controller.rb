class GmailController < ApplicationController
  def create
    gmail = Gmail.new
    @count = gmail.open_mail
  end
end
