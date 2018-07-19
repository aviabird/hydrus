defmodule Hydrus.EventHandler do
  @moduledoc """
  Exposes functions for managing events.
  """
  alias Hydrus.Event
  import Ecto.Query

  @doc """
  Creates an event with the supplied `params`.

  Expect a params map with signature:
  %{
    user_id: #id of the user to be tracked
    name: # name of the event
    properties: # a map containing information associated
                 with the event.
  }
  """
  @spec create(map) :: {:ok, Event.t()} | {:error, Ecto.Changeset.t()}
  def create(params) do
    repo = Application.fetch_env!(:hydrus, :repo)
    changeset = Event.changeset(%Event{}, params)
    repo.insert(changeset)
  end

  @doc """
  Returns all the data related to a particular
  event from the user.

  Takes as input `user_id` and `event` name.
  """
  @spec get_user_event_details(non_neg_integer, String.t()) :: [map]
  def get_user_event_details(user_id, event_name) do
    repo = Application.fetch_env!(:hydrus, :repo)
    query = from(
      event in Event,
      where: event.user_id == ^user_id and event.name == ^event_name,
      select: event.properties
    )
    repo.all(query)
  end
end
