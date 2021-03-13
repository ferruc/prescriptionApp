defmodule PrescriptionApp.OrdersTest do
  use PrescriptionApp.DataCase

  alias PrescriptionApp.Orders

  describe "orders" do
    alias PrescriptionApp.Orders.Order

    @valid_attrs %{address: "some address", courier: "some courier", patient_name: "some patient_name", pickup_date: ~D[2010-04-17], pickup_time: ~T[14:00:00]}
    @update_attrs %{address: "some updated address", courier: "some updated courier", patient_name: "some updated patient_name", pickup_date: ~D[2011-05-18], pickup_time: ~T[15:01:01]}
    @invalid_attrs %{address: nil, courier: nil, patient_name: nil, pickup_date: nil, pickup_time: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Orders.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Orders.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
      assert order.address == "some address"
      assert order.courier == "some courier"
      assert order.patient_name == "some patient_name"
      assert order.pickup_date == ~D[2010-04-17]
      assert order.pickup_time == ~T[14:00:00]
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Orders.update_order(order, @update_attrs)
      assert order.address == "some updated address"
      assert order.courier == "some updated courier"
      assert order.patient_name == "some updated patient_name"
      assert order.pickup_date == ~D[2011-05-18]
      assert order.pickup_time == ~T[15:01:01]
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end

  describe "deliveries" do
    alias PrescriptionApp.Orders.Delivery

    @valid_attrs %{delivered: true, delivery_date: ~D[2010-04-17]}
    @update_attrs %{delivered: false, delivery_date: ~D[2011-05-18]}
    @invalid_attrs %{delivered: nil, delivery_date: nil}

    def delivery_fixture(attrs \\ %{}) do
      {:ok, delivery} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_delivery()

      delivery
    end

    test "list_deliveries/0 returns all deliveries" do
      delivery = delivery_fixture()
      assert Orders.list_deliveries() == [delivery]
    end

    test "get_delivery!/1 returns the delivery with given id" do
      delivery = delivery_fixture()
      assert Orders.get_delivery!(delivery.id) == delivery
    end

    test "create_delivery/1 with valid data creates a delivery" do
      assert {:ok, %Delivery{} = delivery} = Orders.create_delivery(@valid_attrs)
      assert delivery.delivered == true
      assert delivery.delivery_date == ~D[2010-04-17]
    end

    test "create_delivery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_delivery(@invalid_attrs)
    end

    test "update_delivery/2 with valid data updates the delivery" do
      delivery = delivery_fixture()
      assert {:ok, %Delivery{} = delivery} = Orders.update_delivery(delivery, @update_attrs)
      assert delivery.delivered == false
      assert delivery.delivery_date == ~D[2011-05-18]
    end

    test "update_delivery/2 with invalid data returns error changeset" do
      delivery = delivery_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_delivery(delivery, @invalid_attrs)
      assert delivery == Orders.get_delivery!(delivery.id)
    end

    test "delete_delivery/1 deletes the delivery" do
      delivery = delivery_fixture()
      assert {:ok, %Delivery{}} = Orders.delete_delivery(delivery)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_delivery!(delivery.id) end
    end

    test "change_delivery/1 returns a delivery changeset" do
      delivery = delivery_fixture()
      assert %Ecto.Changeset{} = Orders.change_delivery(delivery)
    end
  end
end
