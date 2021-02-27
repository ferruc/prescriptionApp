defmodule PrescriptionApp.Repo do
  use Ecto.Repo,
    otp_app: :prescriptionApp,
    adapter: Ecto.Adapters.Postgres
end
