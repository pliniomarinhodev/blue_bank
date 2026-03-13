defmodule BlueBank.Accounts do
  alias BlueBank.Accounts.Create
  alias BlueBank.Accounts.Transaction

  defdelegate create(params), to: Create, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
