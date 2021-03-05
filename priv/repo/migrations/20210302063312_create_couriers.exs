defmodule PrescriptionApp.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

  def change do
    create table(:couriers) do
      add :courier_name, :string
      add :courier_address, :string

      timestamps()
    end

  end
end
