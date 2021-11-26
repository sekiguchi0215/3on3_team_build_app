class DeckListsController < ApplicationController
  before_action :set_deck, only: %i[edit update destroy]
  PER_PAGE = 8

  def index
    @decks = current_user.deck_lists.page(params[:page]).per(PER_PAGE).order(:updated_at)
  end

  def show
    @deck = DeckList.find(params[:id])
  end

  def new
    @deck = DeckList.new
  end

  def create
    @deck = current_user.deck_lists.new(deck_list_params)
    if @deck.save
      redirect_to user_path(current_user.id), notice: "デッキを登録しました。"
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @deck.update(deck_list_params)
      redirect_to user_path(current_user.id), notice: "更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to deck_lists_path, alert: "削除しました。"
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
