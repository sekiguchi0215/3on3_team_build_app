class UsersController < ApplicationController
  def index
    @users = User.order(:created_at)
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @decks = @user.deck_lists.includes(:user).order(:updated_at)
    else
      @decks = @user.deck_lists.includes(:user).where(status: "public")
    end
  end
end
