defmodule PrescriptionAppWeb.Pharmacy_userController do
  use PrescriptionAppWeb, :controller

  alias PrescriptionApp.Accounts
  alias PrescriptionApp.Accounts.Pharmacy_user

  def index(conn, _params) do
    pharmacy_users = Accounts.list_pharmacy_users()
    render(conn, "index.html", pharmacy_users: pharmacy_users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_pharmacy_user(%Pharmacy_user{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pharmacy_user" => pharmacy_user_params}) do
    case Accounts.create_pharmacy_user(pharmacy_user_params) do
      {:ok, pharmacy_user} ->
        conn
        |> put_flash(:info, "Pharmacy user created successfully.")
        |> redirect(to: Routes.pharmacy_user_path(conn, :show, pharmacy_user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pharmacy_user = Accounts.get_pharmacy_user!(id)
    render(conn, "show.html", pharmacy_user: pharmacy_user)
  end

  def edit(conn, %{"id" => id}) do
    pharmacy_user = Accounts.get_pharmacy_user!(id)
    changeset = Accounts.change_pharmacy_user(pharmacy_user)
    render(conn, "edit.html", pharmacy_user: pharmacy_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pharmacy_user" => pharmacy_user_params}) do
    pharmacy_user = Accounts.get_pharmacy_user!(id)

    case Accounts.update_pharmacy_user(pharmacy_user, pharmacy_user_params) do
      {:ok, pharmacy_user} ->
        conn
        |> put_flash(:info, "Pharmacy user updated successfully.")
        |> redirect(to: Routes.pharmacy_user_path(conn, :show, pharmacy_user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pharmacy_user: pharmacy_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pharmacy_user = Accounts.get_pharmacy_user!(id)
    {:ok, _pharmacy_user} = Accounts.delete_pharmacy_user(pharmacy_user)

    conn
    |> put_flash(:info, "Pharmacy user deleted successfully.")
    |> redirect(to: Routes.pharmacy_user_path(conn, :index))
  end
end
