defmodule BlueBank.Users do
  alias BlueBank.Users.Create
  alias BlueBank.Users.Delete
  alias BlueBank.Users.Get
  alias BlueBank.Users.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
end
