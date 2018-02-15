require 'open-uri'
class ScrappingCryptos
  def initialize
    @cryptos = Hash.new
    @cryptos_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  end

  def all_crypto
    @crypto_names = @cryptos_page.css('a[class="currency-name-container"]').take(100).map{|id| id.text.downcase}
  end

  def find_value
    all_crypto    
    @prices = @cryptos_page.css("a[class=price]").map{|crypto| crypto.text.downcase}
    @cryptos = Hash[@crypto_names.zip(@prices)]
  end
end