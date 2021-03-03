defmodule PrescriptionAppWeb.CourierController do
  use PrescriptionAppWeb, :controller

  alias PrescriptionApp.Couriers
  alias PrescriptionApp.Couriers.Courier

  def index(conn, _params) do
    couriers = Couriers.list_couriers()
    render(conn, "index.html", couriers: couriers)
  end

  def new(conn, _params) do
    changeset = Couriers.change_courier(%Courier{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"courier" => courier_params}) do
    case Couriers.create_courier(courier_params) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier created successfully.")
        |> redirect(to: Routes.courier_path(conn, :show, courier))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    courier = Couriers.get_courier!(id)
    render(conn, "show.html", courier: courier)
  end

  def edit(conn, %{"id" => id}) do
    courier = Couriers.get_courier!(id)
    changeset = Couriers.change_courier(courier)
    render(conn, "edit.html", courier: courier, changeset: changeset)
  end

  def update(conn, %{"id" => id, "courier" => courier_params}) do
    courier = Couriers.get_courier!(id)

    case Couriers.update_courier(courier, courier_params) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier updated successfully.")
        |> redirect(to: Routes.courier_path(conn, :show, courier))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", courier: courier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    courier = Couriers.get_courier!(id)
    {:ok, _courier} = Couriers.delete_courier(courier)

    conn
    |> put_flash(:info, "Courier deleted successfully.")
    |> redirect(to: Routes.courier_path(conn, :index))
  end
end
