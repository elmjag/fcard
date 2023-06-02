defmodule Fcards do
  import Load
  import Quiz
  use Bakeware.Script
  
  def maybe_quiz(deck_file) do
    cond do
      not File.exists?(deck_file) ->
        IO.puts("file '#{deck_file}' not found")
      not File.regular?(deck_file) ->
        IO.puts("'#{deck_file}' is not a file")
      true ->
        quiz_deck(load_deck(deck_file))
    end
  end

  @impl Bakeware.Script
  def main(args) do
    case args do
      [deck_file] ->
        maybe_quiz(deck_file)
      _ ->
        IO.puts("usage: fcards <deck_file>")
    end
  end
end
