defmodule BlueBankWeb.UsersController do
  use BlueBankWeb, :controller

  alias BlueBank.Users.Create
  alias BlueBank.Users.User

  action_fallback BlueBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
