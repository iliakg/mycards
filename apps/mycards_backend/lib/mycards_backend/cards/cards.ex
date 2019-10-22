defmodule MycardsBackend.Cards do
  @moduledoc """
  """

  import Ecto.{Changeset}, warn: false

  alias MycardsBackend.Repo
  alias MycardsBackend.Cards.CardsSet

  def find_set_by_id(id), do: Repo.get!(CardsSet, id)

  def create_set(user, params \\ %{}) do
    Ecto.build_assoc(user, :cards_sets, params)
    |> Repo.insert()
  end

  def create_card(cards_set, params \\ %{}) do
    Ecto.build_assoc(cards_set, :cards, params)
    |> Repo.insert()
  end
end
