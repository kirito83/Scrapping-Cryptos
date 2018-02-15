class HomeController < ApplicationController
  def index
    @crypto_names = ScrappingCryptos.new.all_crypto
  end

  def create
    @crypto = params[:crypto]
    redirect_to home_search_path(@crypto)
  end

  def search
    @crypto = params[:crypto]
    @cryptos = ScrappingCryptos.new.find_value
  end
end
