defmodule CrbNominee.Repo.Migrations.AddNonDevFlag do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :is_dev, :boolean, default: false
    end
  end
end
