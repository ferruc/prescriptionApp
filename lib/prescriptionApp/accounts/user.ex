defmodule PrescriptionApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias PrescriptionApp.Accounts.Credential
  alias PrescriptionApp.Orders.Order
  alias PrescriptionApp.Accounts.Pharmacy_user
  alias PrescriptionApp.Accounts.Courier_user 

  schema "users" do
    #field :email, :string
    field :name, :string
    field :username, :string
    has_one :credential, Credential
    has_many :orders, Order
    has_one :pharmacy_user, Pharmacy_user
    has_one :courier_user, Courier_user
    

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end
