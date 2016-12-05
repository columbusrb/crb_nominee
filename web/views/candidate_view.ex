defmodule CrbNominee.CandidateView do
  use CrbNominee.Web, :view

  def developer_status(candidate) do
    if(candidate.is_dev) do
      "Professional Developer"
    end
  end
end
