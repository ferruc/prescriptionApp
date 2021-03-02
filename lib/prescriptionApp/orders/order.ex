defmodule PrescriptionApp.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :address, :string
    field :courier, :string
    field :patient_name, :string
    field :pickup_date, :date
    field :pickup_time, :time
    field :deliveried, :boolean

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:patient_name, :address, :pickup_date, :pickup_time, :courier])
    |> validate_required([:patient_name, :address, :pickup_date, :pickup_time])
  end
end
