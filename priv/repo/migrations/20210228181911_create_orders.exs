defmodule PrescriptionApp.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :patient_name, :string
      add :address, :string
      add :pickup_date, :date
      add :pickup_time, :time
      add :courier, :string
      add :deliveried, :bool

      timestamps()
    end

  end
end
