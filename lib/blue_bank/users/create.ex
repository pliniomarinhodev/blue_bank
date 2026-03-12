defmodule BlueBank.Users.Create do
  alias BlueBank.Users.User
  alias BlueBank.Repo
  alias BlueBank.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:blue_bank, :via_cep_client, ViaCepClient)
  end
end
