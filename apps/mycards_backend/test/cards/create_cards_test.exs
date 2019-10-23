defmodule MycardsBackend.CreateCardsTest do
  use ExUnit.Case
  use MycardsBackend.RepoCase
  doctest MycardsBackend

  import Ecto.Query

  alias MycardsBackend.Repo
  alias MycardsBackend.Accounts.Auth
  alias MycardsBackend.Cards
  alias MycardsBackend.Cards.Card

  @tag :cards
  test "create cards" do
    {:ok, user} = Auth.register("test@gmail.com", "username", "password")
    {:ok, cards_set} = Cards.create_set(user, %{name: "testname"})

    IO.inspect cards_set

    cards = [
      %Card{front: "pineapple", back: "ананас"},
      %Card{front: "peach", back: "персик"}
    ]

    # cards = %Card{front: "pineapple", back: "ананас"}

    Cards.create_cards(cards_set, cards)

    resp =
      from(c in Card, select: c.front)
      |> Repo.all
    IO.inspect resp
  end
end
