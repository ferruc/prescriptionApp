defmodule PrescriptionApp.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

  def change do
    create table(:couriers) do
      add :courier_name, :string
      add :courier_address, :string
      #add :pharmacy_id, references(:pharmacies, on_delete: :delete_all),
      #add :user_id, references(:users, on_delete: :delete_all),
       # null: false


      timestamps()
    end

    #create index(:couriers, [:pharmacy_id])
  end
end
