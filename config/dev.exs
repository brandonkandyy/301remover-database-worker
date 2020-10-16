use Mix.Config

config :database_worker, :lmdb, database_path: "./301remover-db"

config :database_worker, :amqp,
  host: "localhost",
  username: "301remover",
  password: "your_password_here"
