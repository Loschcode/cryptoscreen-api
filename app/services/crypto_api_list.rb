require 'cryptocompare'

class CryptoApiList

  def initialize
  end

  def fetch
    list['Data'].reduce([]) do |acc, data|
      acc << {
        code: data.last['Symbol'], # the API is actually wrong since a symbol should be such as $ € ..
        symbol: data.last['Symbol'], # TODO : someday we will add the feature for the symbols of each currency
        name: data.last['Name'],
        coin_name: data.last['CoinName'],
        full_name: data.last['FullName'],
        algorithm: data.last['Algorithm'],
        proof_type: data.last['ProofType'],
        # rank: data.last['SortOrder'], # was replaced by the top 100 and then unknown rank it's in another task
        # we manipulate the URL because it's not only a path
        # we can change it easily this way.
        logo_url: logo_url(data)
      }
    end
  end

  private

  def logo_url(data)
    if data.last['ImageUrl']
      "/static/images/coins/#{data.last['ImageUrl']}"
    else
      ""
    end
  end

  def list
    @list ||= Cryptocompare::CoinList.all
  end

end
