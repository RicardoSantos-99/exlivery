defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns the item" do
      response = Item.build("Pizza", :pizza, "35.5", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns the error" do
      response = Item.build("Pizza", :banana, "35.5", 1)

      expected_response = {:error, "invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns the error" do
      response = Item.build("Pizza", :pizza, "banana", 1)

      expected_response = {:error, "invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns the error" do
      response = Item.build("Pizza", :pizza, "35.5", 0)

      expected_response = {:error, "invalid parameters"}

      assert response == expected_response
    end
  end
end
