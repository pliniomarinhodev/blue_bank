defmodule BlueBank.Users.Delete do
  alias BlueBank.Users.User
  alias BlueBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
