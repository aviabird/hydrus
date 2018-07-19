defmodule Hydrus do
  @moduledoc """
  APIs for Hydrus.
  """
  alias Hydrus.EventHandler

  defdelegate create(params), to: EventHandler
  defdelegate get_details(user_id, name),
    to: EventHandler, as: :get_user_event_details
end
