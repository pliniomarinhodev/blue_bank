defmodule BlueBankWeb.AccountsController do
  use BlueBankWeb, :controller

  alias BlueBank.Accounts
  alias BlueBank.Accounts.Account

  action_fallback BlueBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, result} <- Accounts.transaction(params) do
      conn
      |> put_status(:ok)
      |> render(:transaction, transaction: result)
    end
  end
end
