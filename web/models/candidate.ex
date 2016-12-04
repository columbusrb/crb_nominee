defmodule CrbNominee.Candidate do
  use CrbNominee.Web, :model
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

    timestamps()
  end

  @required_fields ~w(name bio why what twitter)
  @optional_fields ~w()

  @required_file_fields ~w(avatar)
  @optional_file_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> put_uuid()
    |> cast_attachments(params, [:avatar])
    |> validate_required([:name, :bio, :why, :what, :twitter, :avatar])
  end

  defp put_uuid(changeset) do
    case changeset do
      %Ecto.Changeset{ data: %{uuid: nil }} ->
        put_change(changeset, :uuid, UUID.uuid1())
    _ ->
       changeset
    end
  end
end
