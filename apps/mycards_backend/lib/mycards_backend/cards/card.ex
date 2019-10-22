defmodule MycardsBackend.Cards.Card do
  use Ecto.Schema

  schema "cards" do
    field(:front, :string)
    field(:back, :string)

    belongs_to(:cards_set, MycardsBackend.Cards.CardsSet)

    timestamps()
  end
end
