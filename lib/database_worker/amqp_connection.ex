defmodule DatabaseWorker.AmqpConnection do
  defp start_server(conn, domain) do
    unless "#{Mix.env()}" === "test" do
      DatabaseWorker.RPCServer.start_link(conn, domain)
    else
      MockServer.start_link(conn, domain)
    end
  end

  defp start_client(conn) do
    unless "#{Mix.env()}" === "test" do
      DatabaseWorker.RPCClient.start_link(conn)
    else
      MockClient.start_link(conn)
    end
  end

  def start_link() do
    {:ok, conn} =
      unless "#{Mix.env()}" === "test" do
        params = Application.get_env(:database_worker, :amqp)
        Freddy.Connection.start_link(params)
      else
        Freddy.Connection.start_link(adapter: :sandbox)
      end

    {:ok, _server} = start_server(conn, "bit.ly")
    {:ok, _server} = start_server(conn, "goo.gl")
    {:ok, _server} = start_server(conn, "tinyurl.com")

    {:ok, _client} = start_client(conn)
  end
end
