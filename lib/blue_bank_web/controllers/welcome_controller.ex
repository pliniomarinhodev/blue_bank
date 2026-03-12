defmodule BlueBankWeb.WelcomeController do
  use BlueBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Bem vindo ao BlueBank!"})
  end
end
