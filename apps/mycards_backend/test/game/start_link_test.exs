defmodule MycardsBackend.Game.StartLinkTest do
  use MycardsBackend.RepoCase
  doctest MycardsBackend

  alias MycardsBackend.Accounts.Auth
  alias MycardsBackend.Cards
  alias MycardsBackend.Cards.Card

  @tag :deck
  test "init deck" do
    {:ok, user} = Auth.register("test@gmail.com", "username", "password")
    {:ok, cards_set} = Cards.create_set(user, %{name: "testname"})
    cards = [
      %Card{front: "apple", back: "яблоко"},
      %Card{front: "avocado", back: "авокадо"},
      %Card{front: "peach", back: "персик"},
      %Card{front: "banana", back: "банан"},
      %Card{front: "lemon", back: "лимон"},
      %Card{front: "pear", back: "груша"},
      %Card{front: "pineapple", back: "ананас"}
    ]

    Cards.create_cards(cards_set, cards)
    cards = Repo.all(from(Card))

    MycardsBackend.Game.Supervisor.start_game(user.id, cards)

    # MycardsBackend.Game.current_card(user.id) |> IO.inspect
    MycardsBackend.Game.refuse_card(user.id)
    MycardsBackend.Game.refuse_card(user.id)
    MycardsBackend.Game.accept_card(user.id)
    MycardsBackend.Game.accept_card(user.id)
    MycardsBackend.Game.accept_card(user.id)
    MycardsBackend.Game.current_deck(user.id) |> IO.inspect
  end
end
