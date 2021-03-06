class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def can_track_stock?(ticker)
    under_stock_limit? && !stock_already_tracked?(ticker)
  end

  def under_stock_limit?
    stocks.count < 10
  end

  def stock_already_tracked?(ticker)
    stock = Stock.get_stock(ticker)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end

  def not_friend_with?(id)
    !self.friends.exists?(id: id)
  end

  def self.search_for_friends(to_search)
    results = search("first_name", to_search) + search("last_name", to_search) + search("email", to_search)
    results.uniq
  end

  private
  def self.search(field, to_search)
    where("#{field} like ?", "%#{to_search}%")
  end

end
