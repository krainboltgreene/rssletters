module Rss
  class NewslettersController < ApplicationController
    layout :false

    before_filter :authenticate

    def index
      if account_signed_in?
        @newsletters = NewslettersPresenter.new(current_account.newsletters, params[:provider])
      else
        head :not_found
      end
    end

    private def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        @current_account = Account.find_by(id: username)
      end
    end
  end
end
