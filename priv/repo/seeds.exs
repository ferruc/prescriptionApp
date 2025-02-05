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


#seed create Pharmacies
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
#seed create Couriers
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Courier{
    courier_name: "Same Day Delivery",
    courier_address: "4925 LA Ave, Los Angeles, CA 90056"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Couriers.Courier{
    courier_name: "Previous Day Delivery",
    courier_address: "7433 LA Ct, Los Angeles, CA 90056"

})
#seed create relation Pharmacies Couriers
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
#seed create Users pharmacies
#1 BetterRx
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user1",
    username: "user1BetterRx"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Credential{
    email: "user1@BetterRx.com",
    user_id: 1
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Pharmacy_user{
    pharmacy_id: 1,
    user_id: 1
})
#2
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user2",
    username: "user2BestRx"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Credential{
    email: "user2@BestRx.com",
    user_id: 2
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Pharmacy_user{
    pharmacy_id: 2,
    user_id: 2
})
#3
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user3",
    username: "user3DrugsRUs"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Credential{
    email: "user3@DrugsRUs.com",
    user_id: 3
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Pharmacy_user{
    pharmacy_id: 3,
    user_id: 3
})
#seed create Users couriers
#1
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user4",
    username: "user4SameDayDelivery"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Credential{
    email: "user4@SameDayDelivery.com",
    user_id: 4
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Courier_user{
    courier_id: 1,
    user_id: 4
})
#2
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user5",
    username: "user5PreviousDayDelivery"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Credential{
    email: "user5@PreviousDayDelivery.com",
    user_id: 5
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Courier_user{
    courier_id: 2,
    user_id: 5
})


#1 BetterRx 
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.User{
    name: "user6",
    username: "user6BetterRx"
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Credential{
    email: "user6@BetterRx.com",
    user_id: 6
})
PrescriptionApp.Repo.insert!(%PrescriptionApp.Accounts.Pharmacy_user{
    pharmacy_id: 1,
    user_id: 6
})
