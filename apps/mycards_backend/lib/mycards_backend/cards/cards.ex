defmodule MycardsBackend.Cards do
  @moduledoc """
  """

  import Ecto.{Changeset}, warn: false

  alias MycardsBackend.Repo
  alias MycardsBackend.Cards.CardsSet

  def create_set(user, params \\ %{}) do
    Ecto.build_assoc(user, :cards_sets, params)
    |> Repo.insert()
  end
end
