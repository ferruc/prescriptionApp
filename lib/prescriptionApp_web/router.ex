defmodule PrescriptionAppWeb.Router do
  use PrescriptionAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PrescriptionAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    
    resources "/pharmacies", PharmacyController
    resources "/orders", OrderController
    get "/orders", Order_todayController , :today_orders
    #get "/orders", OrderController , :index
    resources "/couriers", CourierController
    resources "/users", UserController
    resources "/deliveries", DeliveryController


  end



  #scope "/admin", PrescriptionAppWeb.Admin, as: :admin do
  #  pipe_through :browser
  #
  #  resources "/pharmacies", PharmacyController
  #end

  

  # Other scopes may use custom stacks.
  # scope "/api", PrescriptionAppWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PrescriptionAppWeb.Telemetry
    end
  end
end
