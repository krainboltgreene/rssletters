class AddressesController < ApplicationController
  before_action :authenticate_account!

  def index
    @addresses = current_account.addresses
  end
end
