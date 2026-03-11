defmodule BlueBankWeb.UsersControllerTest do
  use BlueBankWeb.ConnCase

  alias BlueBank.Users
  alias BlueBank.Users.User

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      params = %{
        name: "John Doe",
        email: "john.doe@example.com",
        cep: "01001000",
        password: "123456"
      }
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
      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user", %{conn: conn} do
      params = %{
        name: "John Doe",
        email: "john.doe@example.com",
        cep: "01001000",
        password: "123456"
      }

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
