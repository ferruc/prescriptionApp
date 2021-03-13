defmodule PrescriptionApp.Repo.Migrations.CreateDeliveries do
  use Ecto.Migration

  def change do
    create table(:deliveries) do
      add :delivery_date, :date
      add :delivered, :boolean, default: false, null: false
      #add :order_id, references(:orders, on_delete: :nothing)
      add :order_id, references(:orders, on_delete: :delete_all),
                   null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:deliveries, [:order_id])
  end
end
