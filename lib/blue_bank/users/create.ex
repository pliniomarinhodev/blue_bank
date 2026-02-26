defmodule BlueBank.Users.Create do
  alias BlueBank.Users.User
  alias BlueBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
