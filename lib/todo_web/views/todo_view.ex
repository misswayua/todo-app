defmodule TodoWeb.TodoComponent do
  use Phoenix.Component

  def date(assigns) do
    inserted_at = assigns.inserted_at
    date_text = case Date.compare(Date.utc_today(), inserted_at) do
      :eq -> "Today"
      :gt -> "Tomorrow"
      _ -> "Yesterday"
    end
    ~H"""
    <span><%= date_text %></span>
    """
  end

  def time(assigns) do
    time_string = assigns.inserted_at
    |> NaiveDateTime.to_time()
    |> Time.to_string()
    ~H"""
    <span><%= time_string %></span>
    """
  end

  def status(assigns) do
    ~H"""
    <span>Not started</span>
    """
  end
end
