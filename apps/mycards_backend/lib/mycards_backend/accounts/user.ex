defmodule MycardsBackend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:username, :string)
    field(:encrypted_password, :string)
    field(:password_salt, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    has_many :cards_sets, MycardsBackend.Cards.CardsSet

    timestamps()
  end

  @required_fields ~w(email encrypted_password password_salt)
  @optional_fields ~w()

  def changeset(user, params \\ :empty) do
    user
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
  end
end
