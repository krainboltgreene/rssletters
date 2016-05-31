class NewslettersController < ApplicationController
  before_action :authenticate_account!

  def index
    @newsletters = case
    when params[:filter][:address]
      current_account.newsletters.where(address_id: params[:filter][:address])
    else
      current_account.newsletters
    end.order(:created_at)
  end
end
