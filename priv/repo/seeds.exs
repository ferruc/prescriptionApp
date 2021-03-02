# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PrescriptionApp.Repo.insert!(%PrescriptionApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.



PrescriptionApp.Repo.insert!(%PrescriptionApp.Pharmacies.Pharmacy{
    name: "BetterRx",
    address: "1275 Kinnear Road, Colombus,OH 43212"
})

PrescriptionApp.Repo.insert!(%PrescriptionApp.Pharmacies.Pharmacy{
    name: "BestRx",
    address: "123 Austin St, Austin, TX 78702"
})

PrescriptionApp.Repo.insert!(%PrescriptionApp.Pharmacies.Pharmacy{
    name: "Drugs R Us",
    address: "4925 LA Ave, Los Angeles, CA 90056"
})