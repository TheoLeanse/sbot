defmodule Slackbot.Repo do
  use Ecto.Repo,
    otp_app: :slackbot,
    adapter: Ecto.Adapters.Postgres
end
