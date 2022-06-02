defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  import Exlivery.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Ricardo",
        address: "teste teste",
        email: "john@thre",
        cpf: "123345678",
        age: 18
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid, returns an error" do
      params = %{
        name: "Ricardo",
        address: "teste teste",
        email: "john@thre",
        cpf: "123345678",
        age: 12
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "invalid parameters"}

      assert response == expected_response
    end
  end
end
