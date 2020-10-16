defmodule DatabaseWorker.RPCClient do
  use Freddy.RPC.Client
  alias Freddy.RPC.Request

  @exchange %Freddy.Core.Exchange{
    name: "301remover-resolver",
    type: :direct,
    opts: [durable: false]
  }

  @config [exchange: @exchange]

  def start_link(conn, _opts \\ []) do
    Freddy.RPC.Client.start_link(__MODULE__, conn, @config, nil, name: __MODULE__)
  end

  def request(client, routing_key, payload) do
    Freddy.RPC.Client.request(client, routing_key, payload)
  end

  @impl true
  def on_timeout(request, state) do
    {:reply, {:error, :timeout}, state}
  end

  @impl true
  def on_return(request, state) do
    {:reply, {:error, :no_route}, state}
  end

  @impl true
  def on_response(response, _request, state) do
    {:reply, response, state}
  end
end
