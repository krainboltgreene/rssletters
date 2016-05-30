class NewslettersController < ApplicationController
  before_action :authenticate_account!

  def index
    @newsletters = current_account.newsletters
  end

  def create
    # TODO
  end
end
