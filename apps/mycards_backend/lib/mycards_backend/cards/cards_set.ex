defmodule MycardsBackend.Cards.CardsSet do
  use Ecto.Schema

  schema "cards_sets" do
    field(:name, :string)

    belongs_to(:user, MycardsBackend.Accounts.User)
    has_many(:cards, MycardsBackend.Cards.Card)

    timestamps()
  end
end
