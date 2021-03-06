defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua dos bobos",
          "Bob",
          "bob@bobs.com",
          "12345678901",
          27
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns the error" do
      response =
        User.build(
          "Rua dos bobos",
          "Bob jr",
          "bob@bobs.com",
          "12345678901",
          12
        )

      expected_response = {:error, "invalid parameters"}

      assert response == expected_response
    end
  end
end
