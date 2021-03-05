defmodule PrescriptionAppWeb.Pharmacy_userControllerTest do
  use PrescriptionAppWeb.ConnCase

  alias PrescriptionApp.Accounts

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:pharmacy_user) do
    {:ok, pharmacy_user} = Accounts.create_pharmacy_user(@create_attrs)
    pharmacy_user
  end

  describe "index" do
    test "lists all pharmacy_users", %{conn: conn} do
      conn = get(conn, Routes.pharmacy_user_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pharmacy users"
    end
  end

  describe "new pharmacy_user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pharmacy_user_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pharmacy user"
    end
  end

  describe "create pharmacy_user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pharmacy_user_path(conn, :create), pharmacy_user: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pharmacy_user_path(conn, :show, id)

      conn = get(conn, Routes.pharmacy_user_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pharmacy user"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pharmacy_user_path(conn, :create), pharmacy_user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pharmacy user"
    end
  end

  describe "edit pharmacy_user" do
    setup [:create_pharmacy_user]

    test "renders form for editing chosen pharmacy_user", %{conn: conn, pharmacy_user: pharmacy_user} do
      conn = get(conn, Routes.pharmacy_user_path(conn, :edit, pharmacy_user))
      assert html_response(conn, 200) =~ "Edit Pharmacy user"
    end
  end

  describe "update pharmacy_user" do
    setup [:create_pharmacy_user]

    test "redirects when data is valid", %{conn: conn, pharmacy_user: pharmacy_user} do
      conn = put(conn, Routes.pharmacy_user_path(conn, :update, pharmacy_user), pharmacy_user: @update_attrs)
      assert redirected_to(conn) == Routes.pharmacy_user_path(conn, :show, pharmacy_user)

      conn = get(conn, Routes.pharmacy_user_path(conn, :show, pharmacy_user))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, pharmacy_user: pharmacy_user} do
      conn = put(conn, Routes.pharmacy_user_path(conn, :update, pharmacy_user), pharmacy_user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pharmacy user"
    end
  end

  describe "delete pharmacy_user" do
    setup [:create_pharmacy_user]

    test "deletes chosen pharmacy_user", %{conn: conn, pharmacy_user: pharmacy_user} do
      conn = delete(conn, Routes.pharmacy_user_path(conn, :delete, pharmacy_user))
      assert redirected_to(conn) == Routes.pharmacy_user_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pharmacy_user_path(conn, :show, pharmacy_user))
      end
    end
  end

  defp create_pharmacy_user(_) do
    pharmacy_user = fixture(:pharmacy_user)
    %{pharmacy_user: pharmacy_user}
  end
end
