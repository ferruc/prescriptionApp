defmodule PrescriptionApp.Couriers.Courier do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Accounts.Courier_user 

  schema "couriers" do
    field :courier_address, :string
    field :courier_name, :string
    has_many :courier_users, Courier_user

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:courier_name, :courier_address])
    |> validate_required([:courier_name, :courier_address])
  end
end
