defmodule BlueBankWeb.UsersJSON do
  alias BlueBank.Users.User

  def login(%{token: token, user: user}), do: %{message: "User logado com sucesso!", data: data(user), Bearer: token}
  def create(%{user: user}), do: %{message: "User criado com sucesso!", data: data(user)}
  def delete(%{user: user}), do: %{message: "User deletado com sucesso!", data: data(user)}
  def get(%{user: user}), do: %{data: user}
  def update(%{user: user}), do: %{message: "User atualizado com sucesso!", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep
    }
  end
end
