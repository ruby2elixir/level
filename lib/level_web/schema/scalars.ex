defmodule LevelWeb.Schema.Scalars do
  @moduledoc """
  GraphQL scalar type definitions.
  """

  use Absinthe.Schema.Notation
  alias LevelWeb.Schema.Cursor

  @desc """
  The `Time` scalar type represents time values provided in the ISOz
  datetime format (that is, the ISO 8601 format without the timezone offset, e.g.,
  "2015-06-24T04:50:34Z").
  """
  scalar :time do
    parse &Timex.parse(&1.value, "{ISO:Extended:Z}")
    serialize &Timex.format!(&1, "{ISO:Extended:Z}")
  end

  @desc "A cursor for pagination."
  scalar :cursor do
    parse &Cursor.parse(&1.value)
    serialize &Cursor.serialize(&1)
  end
end