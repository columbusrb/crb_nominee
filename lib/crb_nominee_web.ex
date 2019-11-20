defmodule CrbNomineeWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use CrbNomineeWeb, :controller
      use CrbNomineeWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: CrbNomineeWeb
      alias CrbNominee.Repo

      import Plug.Conn
      import CrbNomineeWeb.Gettext
      # alias CrbNomineeWeb.Router.Helpers, as: Routes
      import CrbNomineeWeb.Router.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/crb_nominee_web/templates",
                        namespace: CrbNomineeWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      alias CrbNominee.Repo

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import CrbNomineeWeb.ErrorHelpers
      import CrbNomineeWeb.Gettext
      # alias CrbNomineeWeb.Router.Helpers, as: Routes
      import CrbNomineeWeb.Router.Helpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
      alias CrbNominee.Repo
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias CrbNominee.Repo
      import Ecto
      import Ecto.Query
      import CrbNomineeWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
