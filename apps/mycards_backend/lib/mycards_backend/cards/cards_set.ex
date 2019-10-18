defmodule MycardsBackend.Cards.CardsSet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards_sets" do
    field(:name, :string)
    belongs_to(:user, MycardsBackend.Accounts.User)

    timestamps()
  end
end
