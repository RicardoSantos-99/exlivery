defmodule Exlivery.Factory do
  use ExMachina
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Bob",
      address: "Rua dos bobos",
      email: "bob@bobs.com",
      cpf: "12345678901",
      age: 27
    }
  end
end
