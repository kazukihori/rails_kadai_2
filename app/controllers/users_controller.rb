class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def create

  end



  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def profile_update
   @user = current_user
  end

  def destroy
    
  end

  p
end
