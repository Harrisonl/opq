defmodule OPQ.Options do
  @moduledoc """
  Options for configuring OPQ.
  """

  @worker  OPQ.Worker
  @workers 10

  @doc """
  ## Examples

      iex> Options.assign_defaults([]) |> Keyword.get(:workers)
      10

      iex> Options.assign_defaults([workers: 4]) |> Keyword.get(:workers)
      4
  """
  def assign_defaults(opts) do
    Keyword.merge([
      worker:  worker(),
      workers: workers(),
    ], opts)
  end

  defp worker,  do: Application.get_env(:opq, :worker)  || @worker
  defp workers, do: Application.get_env(:opq, :workers) || @workers
end
