defmodule TodoWeb.TodoView do
  use TodoWeb, :view

  def date(inserted_at) do
    case Date.compare(Date.utc_today(), inserted_at) do
      :eq -> "Today"
      :gt -> "Tommorow"
      _ -> "Yesterday"
    end
  end

  def time(inserted_at) do
    inserted_at
    |> NaiveDateTime.to_time()
    |> Time.to_string()
  end

  def status() do
    "Not started"
  end
end
