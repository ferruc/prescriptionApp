defmodule PrescriptionApp.Repo.Migrations.CreatePharmacyUsers do
  use Ecto.Migration

  def change do
    create table(:pharmacy_users) do
      add :user_id, references(:users, on_delete: :nothing)
      add :pharmacy_id, references(:pharmacies, on_delete: :nothing)

      timestamps()
    end

    create index(:pharmacy_users, [:user_id])
    create index(:pharmacy_users, [:pharmacy_id])
  end
end
