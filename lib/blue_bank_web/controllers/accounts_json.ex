defmodule BlueBankWeb.AccountsJSON do
  alias BlueBank.Accounts.Account

  def create(%{account: account}), do: %{message: "Conta criada com sucesso!", data: data(account)}
  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}) do
    %{message: "Transação realizada com sucesso!",
      from_account: data(from_account),
      to_account: data(to_account)}
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      balance: account.balance,
      user_id: account.user_id
    }
  end
end
