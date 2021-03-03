defmodule PrescriptionApp.CouriersTest do
  use PrescriptionApp.DataCase

  alias PrescriptionApp.Couriers

  describe "couriers" do
    alias PrescriptionApp.Couriers.Courier

    @valid_attrs %{courier_address: "some courier_address", courier_name: "some courier_name"}
    @update_attrs %{courier_address: "some updated courier_address", courier_name: "some updated courier_name"}
    @invalid_attrs %{courier_address: nil, courier_name: nil}

    def courier_fixture(attrs \\ %{}) do
      {:ok, courier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Couriers.create_courier()

      courier
    end

    test "list_couriers/0 returns all couriers" do
      courier = courier_fixture()
      assert Couriers.list_couriers() == [courier]
    end

    test "get_courier!/1 returns the courier with given id" do
      courier = courier_fixture()
      assert Couriers.get_courier!(courier.id) == courier
    end

    test "create_courier/1 with valid data creates a courier" do
      assert {:ok, %Courier{} = courier} = Couriers.create_courier(@valid_attrs)
      assert courier.courier_address == "some courier_address"
      assert courier.courier_name == "some courier_name"
    end

    test "create_courier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Couriers.create_courier(@invalid_attrs)
    end

    test "update_courier/2 with valid data updates the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{} = courier} = Couriers.update_courier(courier, @update_attrs)
      assert courier.courier_address == "some updated courier_address"
      assert courier.courier_name == "some updated courier_name"
    end

    test "update_courier/2 with invalid data returns error changeset" do
      courier = courier_fixture()
      assert {:error, %Ecto.Changeset{}} = Couriers.update_courier(courier, @invalid_attrs)
      assert courier == Couriers.get_courier!(courier.id)
    end

    test "delete_courier/1 deletes the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{}} = Couriers.delete_courier(courier)
      assert_raise Ecto.NoResultsError, fn -> Couriers.get_courier!(courier.id) end
    end

    test "change_courier/1 returns a courier changeset" do
      courier = courier_fixture()
      assert %Ecto.Changeset{} = Couriers.change_courier(courier)
    end
  end
end
