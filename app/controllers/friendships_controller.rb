class FriendshipsController < ApplicationController

  def create
    new_friend = User.find(params[:friend])
    current_user.friends << new_friend
    flash[:notice] = "You are now following #{new_friend.full_name}."
    redirect_to my_friends_path
  end

  def destroy
    user_to_unfollow = User.find(params[:id])
    friendship = current_user.friendships.where(friend_id: user_to_unfollow).first
    friendship.destroy
    flash[:notice] = "You successfully unfollowed #{user_to_unfollow.full_name}."
    redirect_to my_friends_path
  end

end
