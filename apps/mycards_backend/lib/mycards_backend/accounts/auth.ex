defmodule MycardsBackend.Accounts.Auth do
  @moduledoc """
  """

  import Ecto.{Query, Changeset}, warn: false

  alias RealWorld.Repo
  alias MycardsBackend.Accounts.User

  def register(attrs \\ %{}) do
    %User{}
  end
end
