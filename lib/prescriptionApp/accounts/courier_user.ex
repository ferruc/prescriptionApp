defmodule PrescriptionApp.Accounts.Courier_user do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Accounts.User
  alias PrescriptionApp.Couriers.Courier

  schema "courier_users" do
    #field :user_id, :id
    #field :courier_id, :id
    belongs_to :user, User
    belongs_to :courier, Courier

    timestamps()
  end

  @doc false
  def changeset(courier_user, attrs) do
    courier_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
