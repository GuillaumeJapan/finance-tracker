class StocksController < ApplicationController
  def search
    if (params[:stock]).present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock.nil?
        flash.now[:alert] = "Please enter a valid symbol to search"
      end
    else
      flash.now[:alert] = "Please enter a symbol to search"
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end