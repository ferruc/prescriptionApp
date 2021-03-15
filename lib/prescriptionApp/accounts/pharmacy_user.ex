defmodule PrescriptionApp.Accounts.Pharmacy_user do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Accounts.User
  alias PrescriptionApp.Pharmacies.Pharmacy 

  schema "pharmacy_users" do
    #field :user_id, :id
    #field :pharmacy_id, :id
    belongs_to :user, User
    belongs_to :pharmacy, Pharmacy

    timestamps()
  end

  @doc false
  def changeset(pharmacy_user, attrs) do
    pharmacy_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
