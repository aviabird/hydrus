defmodule Hydrus do
  @moduledoc """
  Documentation for Hydrus.
  """

  def track(params) do
  	%{name: params[:name], properties: params[:properties]}
  end

end
