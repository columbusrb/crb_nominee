defmodule CrbNominee.Repo.Migrations.CreateCandidate do
  use Ecto.Migration

  def change do
    create table(:candidates) do
      add :name, :string
      add :bio, :text
      add :why, :text
      add :twitter, :string

      timestamps()
    end

  end
end
