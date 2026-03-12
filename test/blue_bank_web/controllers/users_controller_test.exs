defmodule BlueBankWeb.UsersControllerTest do
  use BlueBankWeb.ConnCase

  import Mox

  alias BlueBank.Users
  alias BlueBank.Users.User

  setup do
    params = %{
      "name" => "John Doe",
      "email" => "john.doe@example.com",
      "cep" => "01001000",
      "password" => "123456"
    }

    body = %{
        "bairro" => "Sé",
        "cep" => "01001-000",
        "complemento" => "lado ímpar",
        "ddd" => "11",
        "estado" => "São Paulo",
        "gia" => "1004",
        "ibge" => "3550308",
        "localidade" => "São Paulo",
        "logradouro" => "Praça da Sé",
        "regiao" => "Sudeste",
        "siafi" => "7107",
        "uf" => "SP",
        "unidade" => ""
      }

    {:ok, %{user_params: params, body: body}}
  end

  describe "create/2" do
    test "successfully creates an user", %{conn: conn, user_params: params, body: body} do

      expect(BlueBank.ViaCep.ClientMock, :call, fn _cep ->
        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "id" => _,
                 "name" => "John Doe",
                 "email" => "john.doe@example.com",
                 "cep" => "01001000"
               },
               "message" => "User criado com sucesso!"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        email: "john.doe@example.com",
        cep: "010010",
        password: "123456"
      }

      expect(BlueBank.ViaCep.ClientMock, :call, fn _cep ->
        {:ok, ""}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user", %{conn: conn, user_params: params, body: body} do

      expect(BlueBank.ViaCep.ClientMock, :call, fn _cep ->
        {:ok, body}
      end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "id" => id,
          "name" => "John Doe",
          "email" => "john.doe@example.com",
          "cep" => "01001000"
        },
        "message" => "User deletado com sucesso!"
      }

      assert response == expected_response
    end
  end
end
