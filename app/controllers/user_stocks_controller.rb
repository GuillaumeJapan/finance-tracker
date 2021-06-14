class UserStocksController < ApplicationController

  def create
    max_stocks = 10
    if current_user.stocks.size >= max_stocks
      raise StandardError.new "You cannot track more than #{max_stocks} stocks"
    end
    stock_to_track = Stock.get_stock(params[:ticker])
    if stock_to_track.nil?
      stock_to_track = Stock.new_lookup(params[:ticker])
      stock_to_track.save
    end
    current_user.stocks << stock_to_track
  rescue ActiveRecord::RecordInvalid => invalid
    flash[:alert] = invalid.message
  rescue => e
    flash[:alert] = e.message
  else
    flash[:notice] = "You are now tracking the #{stock_to_track.name} stock."
  ensure
    redirect_to my_portfolio_path
  end

end
