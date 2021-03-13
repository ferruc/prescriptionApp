defmodule PrescriptionApp.Orders.Delivery do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Orders.Order

  schema "deliveries" do
    field :delivered, :boolean, default: false
    field :delivery_date, :date
    #field :order_id, :id
    field :user_id, :id
    belongs_to :order, Order

    timestamps()
  end

  @doc false
  def changeset(delivery, attrs) do
    delivery
    |> cast(attrs, [:delivery_date, :delivered])
    #|> validate_required([:delivery_date, :delivered])
  end
end
