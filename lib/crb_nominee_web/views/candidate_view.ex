defmodule CrbNomineeWeb.CandidateView do
  use CrbNomineeWeb, :view

  def developer_status(candidate) do
    if(candidate.is_dev) do
      "Early-Career or Non-Developer"
    end
  end
end
