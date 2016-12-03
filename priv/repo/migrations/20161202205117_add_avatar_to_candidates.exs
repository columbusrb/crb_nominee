defmodule CrbNominee.Repo.Migrations.AddAvatarToCandidates do
  use Ecto.Migration

  def change do
    alter table(:candidates) do
      add :avatar, :string
    end
  end
end
