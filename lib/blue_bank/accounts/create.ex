defmodule BlueBank.Accounts.Create do
  alias BlueBank.Accounts.Account
  alias BlueBank.Repo
  alias BlueBank.Users.User
  alias BlueBank.Users

  def call(params) do
    with {:ok, %User{}} <- Users.get(params["user_id"]) do
      params
      |> Account.changeset()
      |> Repo.insert()
    end
  end
end
