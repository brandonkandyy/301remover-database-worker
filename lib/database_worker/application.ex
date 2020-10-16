defmodule DatabaseWorker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    database_path = Application.get_env(:database_worker, :lmdb)[:database_path]

    # TODO: these domain names should be fetched from the server
    domains = ["bit.ly", "goo.gl", "tinyurl.com"]

    children = [
      {DatabaseWorker.Storage, [%{path: database_path, domains: domains}]},
      worker(DatabaseWorker.AmqpConnection, [])
    ]

    opts = [strategy: :one_for_one, name: DatabaseWorker.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
