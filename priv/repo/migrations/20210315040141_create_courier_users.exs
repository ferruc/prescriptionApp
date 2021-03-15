defmodule PrescriptionApp.Repo.Migrations.CreateCourierUsers do
  use Ecto.Migration

  def change do
    create table(:courier_users) do
      #add :user_id, references(:users, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :delete_all),
       null: false
      #add :courier_id, references(:couriers, on_delete: :nothing)
      add :courier_id, references(:couriers, on_delete: :delete_all),
       null: false

      timestamps()
    end

    create index(:courier_users, [:user_id])
    create index(:courier_users, [:courier_id])
  end
end
