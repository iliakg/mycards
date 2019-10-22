defmodule MycardsBackend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:username, :string)
    field(:encrypted_password, :string)
    field(:password_salt, :string)
    field(:password, :string, virtual: true)

    has_many(:cards_sets, MycardsBackend.Cards.CardsSet)

    timestamps()
  end

  @required_fields ~w(email)a
  @optional_fields ~w(username)a
  @email_format ~r/\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, @email_format)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email, name: :unique_emails)
  end
end
