defmodule PrescriptionAppWeb.DeliveryControllerTest do
  use PrescriptionAppWeb.ConnCase

  alias PrescriptionApp.Orders

  @create_attrs %{delivered: true, delivery_date: ~D[2010-04-17]}
  @update_attrs %{delivered: false, delivery_date: ~D[2011-05-18]}
  @invalid_attrs %{delivered: nil, delivery_date: nil}

  def fixture(:delivery) do
    {:ok, delivery} = Orders.create_delivery(@create_attrs)
    delivery
  end

  describe "index" do
    test "lists all deliveries", %{conn: conn} do
      conn = get(conn, Routes.delivery_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Deliveries"
    end
  end

  describe "new delivery" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.delivery_path(conn, :new))
      assert html_response(conn, 200) =~ "New Delivery"
    end
  end

  describe "create delivery" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.delivery_path(conn, :create), delivery: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.delivery_path(conn, :show, id)

      conn = get(conn, Routes.delivery_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Delivery"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.delivery_path(conn, :create), delivery: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Delivery"
    end
  end

  describe "edit delivery" do
    setup [:create_delivery]

    test "renders form for editing chosen delivery", %{conn: conn, delivery: delivery} do
      conn = get(conn, Routes.delivery_path(conn, :edit, delivery))
      assert html_response(conn, 200) =~ "Edit Delivery"
    end
  end

  describe "update delivery" do
    setup [:create_delivery]

    test "redirects when data is valid", %{conn: conn, delivery: delivery} do
      conn = put(conn, Routes.delivery_path(conn, :update, delivery), delivery: @update_attrs)
      assert redirected_to(conn) == Routes.delivery_path(conn, :show, delivery)

      conn = get(conn, Routes.delivery_path(conn, :show, delivery))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, delivery: delivery} do
      conn = put(conn, Routes.delivery_path(conn, :update, delivery), delivery: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Delivery"
    end
  end

  describe "delete delivery" do
    setup [:create_delivery]

    test "deletes chosen delivery", %{conn: conn, delivery: delivery} do
      conn = delete(conn, Routes.delivery_path(conn, :delete, delivery))
      assert redirected_to(conn) == Routes.delivery_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.delivery_path(conn, :show, delivery))
      end
    end
  end

  defp create_delivery(_) do
    delivery = fixture(:delivery)
    %{delivery: delivery}
  end
end
