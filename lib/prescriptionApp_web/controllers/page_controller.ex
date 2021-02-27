defmodule PrescriptionAppWeb.PageController do
  use PrescriptionAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
