defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.CreateOrUpdate

  describe "call/1" do
    setup do
      cpf = "123123123"
      user = build(:user, cpf: cpf)

      Exlivery.start_agents()

      UserAgent.save(user)

      item1 = %{
        category: :japonesa,
        description: "Temaki",
        unity_price: Decimal.new("30.50"),
        quantity: 2
      }

      item2 = %{
        category: :pizza,
        description: "pizza",
        unity_price: Decimal.new("30.50"),
        quantity: 2
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, return an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "5345353", items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "user not found"}
      assert response == expected_response
    end

    test "when there are invalid items, return an error", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "invalid items"}

      assert response == expected_response
    end

    test "when there are no items, return an error", %{
      user_cpf: cpf
    } do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "invalid parameters"}

      assert response == expected_response
    end
  end
end
