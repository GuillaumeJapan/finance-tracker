class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @stocks = current_user.stocks
  end
  
  def my_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @stocks = @user.stocks
  end
  
  def search
    if (params[:to_search]).present?
      @persons_found = User.search_for_friends(params[:to_search])
      @persons_found.reject! {|user| user == current_user }
      if @persons_found.empty?
        flash.now[:alert] = "Couldn't find users"
      end
    else
      flash.now[:alert] = "Please enter a name or email to search"  
    end
    respond_to do |format|
      format.js { render partial: 'users/result_friends' }
    end
  end

end
