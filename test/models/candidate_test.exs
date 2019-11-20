defmodule CrbNominee.CandidateTest do
  use CrbNominee.ModelCase

  alias CrbNomineeWeb.Candidate

  @valid_attrs %{bio: "some content", id: 42, name: "some content", twitter: "some content", why: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Candidate.changeset(%Candidate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Candidate.changeset(%Candidate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
