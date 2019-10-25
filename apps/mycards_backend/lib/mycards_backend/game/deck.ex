defmodule MycardsBackend.Game.Deck do
  @moduledoc """
  """

  def init_by_set(cards, opts \\ %{}) do
    list = Enum.map(cards, fn card -> %{front: card.front, back: card.back} end)

    list =
      case opts do
        %{sort: "random"} -> Enum.shuffle(list)
        _ -> list
      end

    deck(list, [], 0, length(list))
  end

  def current_card(deck) do
    List.first(deck.actual)
  end

  def next_card(deck) do
    Enum.at(deck.actual, 1)
  end

  def accept_card(deck) do
    deck(
      List.delete_at(deck.actual, 0),
      deck.failed,
      deck.passed_count + 1,
      deck.total_count
    )
  end

  def refuse_card(deck) do
    deck(
      List.delete_at(deck.actual, 0),
      [current_card(deck) | deck.failed],
      deck.passed_count + 1,
      deck.total_count
    )
  end

  defp deck(actual, failed, passed_count, total_count) do
    %{
      actual: actual,
      failed: failed,
      passed_count: passed_count,
      total_count: total_count
    }
  end
end
