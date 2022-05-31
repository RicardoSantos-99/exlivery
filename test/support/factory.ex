defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Order, Item}

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

  def order_factory do
    %Order{
      delivery_address: "Rua dos bobos",
      items: [
        build(:item),
        build(:item,
          description: "Temaki",
          category: :japonesa,
          unity_price: Decimal.new("30.50"),
          quantity: 2
        )
      ],
      total_price: Decimal.new("96.50"),
      user_cpf: "12345678901"
    }
  end
end
