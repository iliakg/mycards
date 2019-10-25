defmodule MycardsBackend.Game.DeckInitTest do
  use MycardsBackend.RepoCase
  doctest MycardsBackend

  alias MycardsBackend.Accounts.Auth
  alias MycardsBackend.Cards
  alias MycardsBackend.Cards.Card

  # @tag :deck
  # test "init deck" do
  #   {:ok, user} = Auth.register("test@gmail.com", "username", "password")
  #   {:ok, cards_set} = Cards.create_set(user, %{name: "testname"})
  #   cards = [
  #     %Card{front: "apple", back: "яблоко"},
  #     %Card{front: "avocado", back: "авокадо"},
  #     %Card{front: "peach", back: "персик"},
  #     %Card{front: "banana", back: "банан"},
  #     %Card{front: "lemon", back: "лимон"},
  #     %Card{front: "pear", back: "груша"},
  #     %Card{front: "pineapple", back: "ананас"}
  #   ]

  #   Cards.create_cards(cards_set, cards)

  #   deck =
  #     Repo.all(from(Card))
  #     |> MycardsBackend.Game.Deck.init_by_set

  #   IO.inspect deck
  # end
end
