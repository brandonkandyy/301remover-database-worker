use Mix.Config

config :database_worker, :lmdb, database_path: System.get_env("DATABASE_PATH")

config :database_worker, :amqp,
  host: System.get_env("RABBITMQ_HOST"),
  username: System.get_env("RABBITMQ_USER"),
  password: System.get_env("RABBITMQ_PASS"),
  virtual_host: System.get_env("RABBITMQ_VHOST")
