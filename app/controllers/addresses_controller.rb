class AddressesController < ApplicationController
  before_action :authenticate_account!

  def index
    @addresses = current_account.addresses
  end

  def show
    @address = Address.find_by(id: params[:id])
  end

  def new
    @address = current_account.addresses.build
  end

  def create
    provider = Provider.find_by(id: params[:address][:provider])
    @address = Address.new(account: current_account, provider: provider)

    if @address.save
      redirect_to @address
    else
      render :new
    end
  end
end
