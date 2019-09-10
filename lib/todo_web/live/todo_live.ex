defmodule TodoWeb.TodoLive do
  use Phoenix.LiveView
  alias Todo.Ideas
  alias TodoWeb.TodoView

  def(mount(_session, socket)) do
    {:ok, get(socket)}
  end

  def render(assigns) do
    TodoView.render("todo.html", assigns)
  end

  def handle_event("add", %{"todo" => todo}, socket) do
    Ideas.create_idea(todo)

    {:noreply, get(socket)}
  end

  def get(socket) do
    assign(socket, todos: Ideas.list_ideas())
  end
end
