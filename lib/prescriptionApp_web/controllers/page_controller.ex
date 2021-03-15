defmodule PrescriptionAppWeb.PageController do
  use PrescriptionAppWeb, :controller

  def index(conn, _params) do
    #render(conn, "index.html")
    render conn, "index.html", current_user: get_session(conn, :current_user)
  end
end
