defmodule BlueBank.Users do
  alias BlueBank.Users.Create
  alias BlueBank.Users.Delete
  alias BlueBank.Users.Get
  alias BlueBank.Users.Update
  alias BlueBank.Users.Verify

  defdelegate create(params), to: Create, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate login(params), to: Verify, as: :call
end
