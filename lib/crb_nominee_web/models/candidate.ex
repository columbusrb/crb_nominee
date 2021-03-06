defmodule CrbNomineeWeb.Candidate do
  use CrbNomineeWeb, :model
  use Arc.Ecto.Schema
  require UUID

  schema "candidates" do
    field :name, :string
    field :bio, :string
    field :why, :string
    field :twitter, :string
    field :avatar, CrbNominee.Avatar.Type
    field :uuid, :string
    field :what, :string
    field :is_dev, :boolean

    timestamps()
  end

  @required_fields ~w(name bio why what twitter is_dev)a
  @optional_fields ~w()a

  @required_file_fields ~w(avatar)a
  @optional_file_fields ~w()a

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> put_uuid()
    |> cast_attachments(params, [:avatar])
    |> validate_required([:name, :bio, :why, :what, :twitter, :avatar, :is_dev])
    |> validate_twitter()
  end

  defp put_uuid(changeset) do
    case changeset do
      %Ecto.Changeset{ data: %{uuid: nil }} ->
        put_change(changeset, :uuid, UUID.uuid1())
      _ ->
         changeset
    end
  end

  defp validate_twitter(changeset) do
    handle = get_field(changeset, :twitter)
    if handle && String.starts_with?(handle, "@") do
      changeset |> change(twitter: String.slice(handle, 1..-1))
    else
      changeset
    end
  end
end
