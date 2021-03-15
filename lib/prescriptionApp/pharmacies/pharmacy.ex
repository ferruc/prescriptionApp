defmodule PrescriptionApp.Pharmacies.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Accounts.Pharmacy_user 


  schema "pharmacies" do
    field :address, :string
    field :name, :string
    has_many :pharmacy_users, Pharmacy_user

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
