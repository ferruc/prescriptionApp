defmodule PrescriptionApp.Repo.Migrations.CreatePharmacies_Couriers do
  use Ecto.Migration

  def change do
    create table(:pharmacies_couriers) do
      add :pharmacy_id, references(:pharmacies, on_delete: :delete_all),
       null: false
      add :courier_id, references(:couriers, on_delete: :delete_all),
      null: false

      timestamps()
    end

    create index(:pharmacies_couriers, [:pharmacy_id])
    create index(:pharmacies_couriers, [:courier_id])
  end
end
