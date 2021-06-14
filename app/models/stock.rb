class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
  validates :ticker,
            uniqueness: { case_sensitive: false },
            length: {in: 1..6}

  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_cloud[:sandbox_api_key],
      secret_token: Rails.application.credentials.iex_cloud[:sandbox_secret_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticker.upcase, name: client.company(ticker).company_name, last_price: client.price(ticker))
    rescue => exception
      nil
    end
  end

  def self.get_stock(ticker)
    where(ticker: ticker).first
  end

end
