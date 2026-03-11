defmodule BlueBank.Users.Create do
  alias BlueBank.Users.User
  alias BlueBank.Repo
  alias BlueBank.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end
