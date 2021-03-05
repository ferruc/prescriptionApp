defmodule PrescriptionApp.Accounts.Pharmacy_user do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pharmacy_users" do
    field :user_id, :id
    field :pharmacy_id, :id

    timestamps()
  end

  @doc false
  def changeset(pharmacy_user, attrs) do
    pharmacy_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
