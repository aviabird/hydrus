defmodule Mix.Tasks.Hydrus.Setup do

  use Mix.Task
  import Mix.Generator

  def run(_) do
    repo = Application.fetch_env!(:hydrus, :repo)
    app_name = Application.fetch_env!(:hydrus, :app)

    bindings = [
      app: app_name,
      repo: repo
    ]

    with :ok <- gen_event_migration(bindings) do
      print_success()
    end
  end

  defp gen_event_migration(bindings) do
    path = Path.join(:code.priv_dir(:hydrus), "/templates/event_migration.eex")
    event_migration = EEx.eval_file(path, bindings)

    create_file("priv/repo/migrations/#{timestamp()}_hydrus_event_migration.exs", event_migration)
  end

  defp print_success() do
    Mix.Shell.IO.info """
      Hydrus Setup Successfully!
    """
  end

  defp timestamp do
    {{y, m, d}, {hh, mm, ss}} = :calendar.universal_time()
    "#{y}#{pad(m)}#{pad(d)}#{pad(hh)}#{pad(mm)}#{pad(ss)}"
  end
  defp pad(i) when i < 10, do: << ?0, ?0 + i >>
  defp pad(i), do: to_string(i)
end
