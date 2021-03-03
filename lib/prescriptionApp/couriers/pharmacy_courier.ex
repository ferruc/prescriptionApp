defmodule PrescriptionApp.Couriers.Pharmacy_courier do
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "pharmacies_couriers" do
      field :pharmacy_id, :id
      field :courier_id, :id
  
      timestamps()
    end
  
    @doc false
    def changeset(courier, attrs) do
      courier
      |> cast(attrs, [:pharmacy_id, :courier_id])
      |> validate_required([:pharmacy_id, :courier_id])
    end
  end
  