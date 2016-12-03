defmodule CrbNominee.Avatar do
  use Arc.Definition
  use Arc.Ecto.Definition

  @acl :public_read
  @versions [:original, :thumb, :nail]

  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
  end

  def transform(:nail, _) do
    {:convert, "-strip -thumbnail 125x125^ -gravity center -extent 125x125 -format png", :png}
  end

  def filename(version, _) do
    version
  end

  def storage_dir(version, {file, scope}) do
    "uploads/avatars/#{scope.uuid}"
  end

end
