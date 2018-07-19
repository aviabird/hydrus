defmodule Hydrus.Event do
  @moduledoc """
  Models an Event.
  """

  @type t :: %__MODULE__{}

  use Ecto.Schema
  import Ecto.Changeset

  schema "hydrus_events" do
    field(:user_id, :integer)
    field(:name, :string)
    field(:properties, :map)

    timestamps()
  end

  @required_fields ~w(user_id name properties)a

  def changeset(%__MODULE__{} = event, params) do
    event
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
