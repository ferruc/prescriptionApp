# PrescriptionApp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## What was the hardest part of the implementation?

Understand how works elixir functional language and understand how works Ecto to create queries.

## What would be your next couple of tasks if you had more time?

* Create independent entity for Patient, now this data is in Order
* Create login module that allows use permissions to Pharmacy, Courier roles
* Implement login with OAuth, that can use permissions
* Implement complete administration module in order to crete Roles, Permissions
* Modify presentation layer.

## How could we change the project to be more interesting?

* Create a module with order tracking in real time.
* Create a Geo spatial module with location information (Pharmacies, Couriers, Users) that allow take decisions about deliveries.
* Create an algorithm in order to optimize time deliveries.



