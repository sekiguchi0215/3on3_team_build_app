class DeckListsController < ApplicationController
  def index
    @decks = current_user.deck_lists.order(:updated_at)
  end

  def show
    @deck = DeckList.find(params[:id])
  end

  def new
    @deck = DeckList.new
  end

  def create
    deck_list = current_user.deck_lists.create!(deck_list_params)
    redirect_to user_path(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def deck_list_params
    params.require(:deck_list).permit(:deck_list, :status, :content)
  end
end
