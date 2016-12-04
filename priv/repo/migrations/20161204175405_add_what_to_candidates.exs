defmodule CrbNominee.Repo.Migrations.AddWhatToCandidates do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :what, :text
    end
  end
end
