defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678901"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua dos bobos",
           age: 27,
           cpf: "12345678901",
           email: "bob@bobs.com",
           name: "Bob"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get("000000000")

      expected_response = {:error, "user not found"}

      assert response == expected_response
    end
  end
end
