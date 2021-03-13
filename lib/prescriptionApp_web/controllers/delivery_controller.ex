defmodule PrescriptionAppWeb.DeliveryController do
  use PrescriptionAppWeb, :controller

  alias PrescriptionApp.Orders
  alias PrescriptionApp.Orders.Delivery

  def index(conn, _params) do
    deliveries = Orders.list_deliveries()
    render(conn, "index.html", deliveries: deliveries)
  end

  def new(conn, _params) do
    changeset = Orders.change_delivery(%Delivery{})
    render(conn, "new.html", changeset: changeset)
  end



  def create(conn, %{"delivery" => delivery_params}) do
    case Orders.create_delivery(delivery_params) do
      {:ok, delivery} ->
        conn
        |> put_flash(:info, "Delivery created successfully.")
        |> redirect(to: Routes.delivery_path(conn, :show, delivery))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    delivery = Orders.get_delivery!(id)
    render(conn, "show.html", delivery: delivery)
  end

  def edit(conn, %{"id" => order_id}) do
    #get id delivery

    id_delivery = Orders.get_id_delivery!(order_id)
    delivery = Orders.get_delivery!(id_delivery)
    changeset = Orders.change_delivery(delivery)
    render(conn, "edit.html", delivery: delivery, changeset: changeset)
  end

  def update(conn, %{"id" => id, "delivery" => delivery_params}) do
    delivery = Orders.get_delivery!(id)

    case Orders.update_delivery(delivery, delivery_params) do
      {:ok, delivery} ->
        conn
        |> put_flash(:info, "Delivery updated successfully.")
        |> redirect(to: Routes.delivery_path(conn, :show, delivery))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", delivery: delivery, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    delivery = Orders.get_delivery!(id)
    {:ok, _delivery} = Orders.delete_delivery(delivery)

    conn
    |> put_flash(:info, "Delivery deleted successfully.")
    |> redirect(to: Routes.delivery_path(conn, :index))
  end
end
