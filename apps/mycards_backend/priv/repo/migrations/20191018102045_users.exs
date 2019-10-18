defmodule MycardsBackend.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string, unique: true)
      add(:username, :string)
      add(:encrypted_password, :string, null: false)
      add(:password_salt, :string, null: false)

      timestamps
    end

    create(unique_index(:users, [:email], name: :unique_emails))
  end
end
