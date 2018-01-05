defmodule CrbNominee.CandidateView do
  use CrbNominee.Web, :view

  def developer_status(candidate) do
    if(candidate.is_dev) do
      "Early-Career or Non-Developer"
    end
  end
end
