defmodule MycardsBackend.Cards do
  @moduledoc """
  """

  import Ecto.{Changeset}, warn: false

  alias MycardsBackend.Repo
  alias MycardsBackend.Cards.CardsSet

  def find_set_by_id(id), do: Repo.get!(CardsSet, id)

  def create_set(user, params \\ %{}) do
    Ecto.build_assoc(user, :cards_sets, params)
    |> Repo.insert
  end

  def create_cards(cards_set, cards) do
    Repo.preload(cards_set, :cards)
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:cards, List.wrap(cards))
    |> Repo.update
  end
end
