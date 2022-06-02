defmodule Exlivery.Orders.CreateOrUpdate do
  alias Exlivery.Users.Order, as: OrderAgent
  alias Exlivery.Orders.Agent, as: UserAgent

  alias Exlivery.Orders.Order

  def call(%{user_cpf: user_cpf, items: items}) do
    with {:ok, user} <- UserAgent.get(user_cpf),
         {:ok, items} <- build_items(items),
         {:ok, order} <- Order.build(user, items) do
      OrderAgent.save(order)
    else
      error -> error
    end
  end

  defp build_items(%{items: items}) do
  end
end
