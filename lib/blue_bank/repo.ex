defmodule BlueBank.Repo do
  use Ecto.Repo,
    otp_app: :blue_bank,
    adapter: Ecto.Adapters.Postgres
end
