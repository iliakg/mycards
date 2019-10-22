defmodule MycardsBackend.Repo.Migrations.Card do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add(:front, :string)
      add(:back, :string)
      add(:cards_set_id, references("cards_sets"))

      timestamps()
    end
  end
end
