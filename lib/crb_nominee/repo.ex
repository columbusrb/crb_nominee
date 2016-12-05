defmodule CrbNominee.Repo do
  use Ecto.Repo, otp_app: :crb_nominee
  use Scrivener, page_size: 25
end
