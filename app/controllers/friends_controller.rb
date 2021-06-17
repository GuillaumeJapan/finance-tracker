class FriendsController < ApplicationController
  def search
    flash.now[:alert] = "Please enter a name or email to search" if !(params[:to_search]).present? 
    @persons_found = User.search_for_friends(params[:to_search])
    @persons_found.reject! {|user| user == current_user }
    respond_to do |format|
      format.js { render partial: 'users/result_friends' }
    end
  end
end