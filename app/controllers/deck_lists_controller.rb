class DeckListsController < ApplicationController
  before_action :set_deck, only: %i[edit update destroy]

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
    @deck.update(deck_list_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @deck.destroy
    redirect_to deck_lists_path
  end

  private

  def deck_list_params
    params.require(:deck_list).permit(:deck_list, :status, :content)
  end

  def set_deck
    @deck = current_user.deck_lists.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません。" if @deck.nil?
  end
end
