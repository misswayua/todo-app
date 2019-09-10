defmodule Todo.Repo.Migrations.CreateIdeas do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :title, :string

      timestamps()
    end

  end
end
