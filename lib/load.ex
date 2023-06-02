defmodule Load do
  alias Exqlite.Sqlite3

  defp read_rows(connection, statement, deck) do
    case Sqlite3.step(connection, statement) do
      {:row, [q, a]} ->
        read_rows(connection, statement, deck ++ [[q, a]])

      :done ->
        deck
    end
  end

  def load_deck(deck_file) do
    IO.puts("loading '#{deck_file}'")

    {:ok, connection} = Sqlite3.open(deck_file)
    {:ok, statement} = Sqlite3.prepare(connection, "select * from deck")

    deck = Enum.shuffle(read_rows(connection, statement, []))
  end
end
