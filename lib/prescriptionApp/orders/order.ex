defmodule PrescriptionApp.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Orders.Delivery
  alias PrescriptionApp.Accounts.User

  schema "orders" do
    field :address, :string
    field :courier, :string
    field :patient_name, :string
    field :pickup_date, :date
    field :pickup_time, :time
   # field :user_id, :id
    #field :deliveried, :boolean
    has_one :delivery, Delivery
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:patient_name, :address, :pickup_date, :pickup_time, :courier])
    |> validate_required([:patient_name, :address, :pickup_date, :pickup_time])
  end
end
