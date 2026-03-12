defmodule BlueBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias BlueBank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "sucessfully returns cep info", %{bypass: bypass} do
      cep = "13040089"
      body = ~s({
          "bairro": "Jardim Nova Europa",
          "cep": "13040-089",
          "complemento": "",
          "ddd": "19",
          "estado": "São Paulo",
          "gia": "2446",
          "ibge": "3509502",
          "localidade": "Campinas",
          "logradouro": "Rua Manoel Sylvestre de Freitas Filho",
          "regiao": "Sudeste",
          "siafi": "6291",
          "uf": "SP",
          "unidade": ""
        })

      expected_response = {:ok, %{"bairro" => "Jardim Nova Europa", "cep" => "13040-089", "complemento" => "", "ddd" => "19", "estado" => "São Paulo", "gia" => "2446", "ibge" => "3509502", "localidade" => "Campinas", "logradouro" => "Rua Manoel Sylvestre de Freitas Filho", "regiao" => "Sudeste", "siafi" => "6291", "uf" => "SP", "unidade" => ""}}

      Bypass.expect(bypass, fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"

end
