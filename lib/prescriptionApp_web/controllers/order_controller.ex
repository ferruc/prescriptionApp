defmodule PrescriptionAppWeb.OrderController do
  use PrescriptionAppWeb, :controller

  

  alias PrescriptionApp.Orders
  alias PrescriptionApp.Orders.Order

  
  
  
  def today_orders(conn, _params) do
    orders = Orders.list_today_orders()
    render(conn, "index_for_today.html", orders: orders)
  end

  

  def index(conn, _params) do
    orders = Orders.list_orders(conn.assigns.current_user)
    today_orders = Orders.list_today_orders(conn.assigns.current_user)
    render(conn, "index.html", orders: orders, today_orders: today_orders)
  end

  def new(conn, _params) do
    changeset = Orders.change_order(%Order{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"order" => order_params}) do
    #user_id = conn.assigns.current_user 
    case Orders.create_order(conn.assigns.current_user, order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, "show.html", order: order)
  end

  def edit(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    changeset = Orders.change_order(order)
    render(conn, "edit.html", order: order, changeset: changeset)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Orders.get_order!(id)

    case Orders.update_order(order, order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", order: order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    {:ok, _order} = Orders.delete_order(order)

    conn
    |> put_flash(:info, "Order deleted successfully.")
    |> redirect(to: Routes.order_path(conn, :index))
  end

  defp authenticate(conn, options) do
    if get_session(conn, :email) in options[:usernames] do
      conn
    else
      conn |> redirect(to: "/") |> halt()
    end
  end

end
