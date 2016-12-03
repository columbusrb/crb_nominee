defmodule CrbNominee.Repo.Migrations.AddUUIDToUser do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :uuid, :string
    end
  end
end
