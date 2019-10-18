defmodule MycardsBackend.Repo.Migrations.CardsSets do
  use Ecto.Migration

  def change do
    create table(:cards_sets) do
      add(:name, :string)
      add :user_id, references("users")

      timestamps
    end
  end
end
