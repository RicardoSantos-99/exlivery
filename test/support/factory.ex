defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Bob",
      address: "Rua dos bobos",
      email: "bob@bobs.com",
      cpf: "12345678901",
      age: 27
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
