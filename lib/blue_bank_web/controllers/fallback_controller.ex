defmodule BlueBankWeb.FallbackController do
  use BlueBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: BlueBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
