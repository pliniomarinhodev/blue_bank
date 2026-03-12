Mox.defmock(BlueBank.ViaCep.ClientMock, for: BlueBank.ViaCep.ClientBehaviour)
Application.put_env(:blue_bank, :via_cep_client, BlueBank.ViaCep.ClientMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(BlueBank.Repo, :manual)
