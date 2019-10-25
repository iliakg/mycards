defmodule MycardsApi.Auth do
  use Joken.Config

  def token_config do
    %{}
    |> add_claim("ct", fn -> current_time() end)
  end

  def issue(user_id) do
    generate_and_sign!(%{"user_id" => user_id})
  end

  def decode(token) do
    verify_and_validate(token)
  end
end
