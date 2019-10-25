defmodule MycardsBackend.Game do
  use GenServer

  @moduledoc """
  """

  alias MycardsBackend.Game.Deck

  # CLIENT
  def start_link(game_id, cards, opts \\ %{}) do
    GenServer.start_link(__MODULE__, Deck.init_by_set(cards, opts), name: via_tuple(game_id))
  end

  def current_card(game_id) do
    GenServer.call(via_tuple(game_id), :current_card)
  end

  def current_deck(game_id) do
    GenServer.call(via_tuple(game_id), :current_deck)
  end

  def next_card(game_id) do
    GenServer.call(via_tuple(game_id), :next_card)
  end

  def accept_card(game_id) do
    GenServer.cast(via_tuple(game_id), :accept_card)
  end

  def refuse_card(game_id) do
    GenServer.cast(via_tuple(game_id), :refuse_card)
  end

  defp via_tuple(game_id) do
    {:via, :gproc, {:n, :l, {:game_id, game_id}}}
  end

  # SERVER
  def init(deck) do
    {:ok, deck}
  end

  def handle_call(:current_card, _from, deck) do
    {:reply, Deck.current_card(deck), deck}
  end

  def handle_call(:current_deck, _from, deck) do
    {:reply, deck, deck}
  end

  def handle_call(:next_card, _from, deck) do
    {:reply, Deck.next_card(deck), deck}
  end

  def handle_cast(:accept_card, deck) do
    {:noreply, Deck.accept_card(deck)}
  end

  def handle_cast(:refuse_card, deck) do
    {:noreply, Deck.refuse_card(deck)}
  end
end
