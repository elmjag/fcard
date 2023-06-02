defmodule Quiz do

  defp ask(question, answer) do
    IO.puts("#{question}?")

    case String.trim_trailing(IO.read(:line)) do
      ^answer ->
        IO.puts("correct\n")
      _ ->
        IO.puts("wrong, try again")
        ask(question, answer)
    end
  end
  
  defp quiz([]) do
    IO.puts("that was all")    
  end
  
  defp quiz([[q, a] | rest]) do
    ask(q, a)
    quiz(rest)
  end

  def quiz_deck(deck) do
    quiz(deck)
  end
end
