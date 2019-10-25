defmodule MycardsApi.AuthTest do
  use ExUnit.Case
  doctest MycardsApi
  @moduletag :auth

  alias MycardsApi.Auth

  test "jwt valid auth" do
    token = Auth.issue(1)

    {:ok, payload} = Auth.verify_and_validate(token)
    assert payload["user_id"] == 1
  end

  test "jwt invalid auth" do
    resp = Auth.decode("token")
    assert resp == {:error, :signature_error}
  end
end
