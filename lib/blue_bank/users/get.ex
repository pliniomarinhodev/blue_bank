defmodule BlueBank.Users.Get do
  alias BlueBank.Users.User
  alias BlueBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
