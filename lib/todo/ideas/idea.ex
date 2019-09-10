defmodule Todo.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ideas" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
