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
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Courier{
    courier_name: "Same Day Delivery",
    courier_address: "4925 LA Ave, Los Angeles, CA 90056"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Courier{
    courier_name: "Previous Day Delivery",
    courier_address: "7433 LA Ct, Los Angeles, CA 90056"

})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Pharmacy_courier{
    pharmacy_id: 2,
    courier_id: 1
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Pharmacy_courier{
    pharmacy_id: 1,
    courier_id: 1
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Pharmacy_courier{
    pharmacy_id: 3,
    courier_id: 2
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user1",
    email: "user1@BetterRx.com"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Pharmacy_user{
    pharmacy_id: 2,
    user_id: 1
})