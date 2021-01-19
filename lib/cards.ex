defmodule Cards do

  @moduledoc """
    Provides methods for creating nad handling a deck of cards
  """
  @doc """
  Returns a list of string representing a deck of cards
  """
   def create_deck() do
   values = ["Ace","Two","Three", "Four","Five"]
   suits = ["Spades","Clubs","Hearts","Diamonds"]

  # cards = for value <- values do ------> returns a list of list
  #   for suit <- suits do
  #     "#{value} of #{suit}"
  #  end
  # end

  # List.flatten(cards)

  for suit <- suits, value <- values do #Instead of making lists of lists, this return to a sinle list!
    "#{value} of #{suit}"
  end
end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
@doc """
Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates how many cards should be in the hand

## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]


"""
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

@doc """
Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates how many cards should be in the hand

## Examples

    iex> deck = Cards.create_deck
    iex> {hand, deck} = Cards.deal(deck,1)
    iex> hand
    ["Ace of Spades"]


"""
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size) # returns a tuple----> sooo how to access the hand? İndex notation wont work! USE PATTERN MATCHING
  end

  def save(deck, filename) do #Call erlang for file management and system!
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do

    #{status, binary} = File.read(filename)

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exit" #for the purposes of pattern mathcing, we need the reason variable, so use ıt lıke that_reason
    end
  end

  # def create_hand(hand_size) do
  #   deck = Cards.create_deck()
  #   deck = Cards.shuffle(deck)
  #   hand = Cards.deal(deck,hand_size)
  # end

  #Pipe operator! --> Same as above, get used to this
  def create_hand(hand_size) do
  Cards.create_deck
  |> Cards.shuffle()
  |> Cards.deal(hand_size)
  end
end
