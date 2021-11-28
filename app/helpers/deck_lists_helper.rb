module DeckListsHelper
  def deck_status(deck)
    if deck.status == "public"
      "公開中"
    else
      "非公開"
    end
  end
end
