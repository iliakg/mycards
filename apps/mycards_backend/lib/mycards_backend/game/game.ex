defmodule MycardsBackend.Game do
  use GenServer
  @moduledoc """
  """

  # CLIENT
  def start_link(game_id) do
    GenServer.start_link(__MODULE__, [], name: via_tuple(game_id))
  end

  def add_card(game_id, message) do
    GenServer.cast(via_tuple(game_id), {:add_card, message})
  end

  def get_cards(game_id) do
    GenServer.call(via_tuple(game_id), :get_cards)
  end

  defp via_tuple(game_id) do
    {:via, :gproc, {:n, :l, {:game_id, game_id}}}
  end

  # SERVER
  def init(cards) do
    {:ok, cards}
  end

  def handle_cast({:add_card, new_message}, messages) do
    {:noreply, [new_message | messages]}
  end

  def handle_call(:get_cards, _from, messages) do
    {:reply, messages, messages}
  end
end
