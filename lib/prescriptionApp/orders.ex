defmodule PrescriptionApp.Orders do
  @moduledoc """
  The Orders context.
  """

  import Ecto.Query, warn: false
  alias PrescriptionApp.Repo

  alias PrescriptionApp.Orders.Order
  alias PrescriptionApp.Orders.Delivery

  @doc """
  Returns the list of orders.

  ## Examples

      iex> list_orders()
      [%Order{}, ...]

  """
  def list_orders do
    Order
    |> Repo.all()
    |> Repo.preload(:delivery)
    #Repo.all(Order)
  end

  
  @doc """
  Returns the list of future events.
  
  ## Examples
  
      iex> list_future_events()
      [%Event{}, ...]
  
    """
  def list_today_orders do
    query = from e in PrescriptionApp.Orders.Order,
    where: e.pickup_date == ^DateTime.utc_now
    Repo.all(query)
  end

  @doc """
  Gets a single order.

  Raises `Ecto.NoResultsError` if the Order does not exist.

  ## Examples

      iex> get_order!(123)
      %Order{}

      iex> get_order!(456)
      ** (Ecto.NoResultsError)

  """
  #def get_order!(id), do: Repo.get!(Order, id)
  def get_order!(id) do
    Order
    |> Repo.get!(id)
    |> Repo.preload(:delivery)
  end

  @doc """
  Creates a order.

  ## Examples

      iex> create_order(%{field: value})
      {:ok, %Order{}}

      iex> create_order(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order(attrs \\ %{}) do
    %Order{}
    |> Order.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:delivery, with: &Delivery.changeset/2)
    |> Repo.insert()
  end

  @doc """
  Updates a order.

  ## Examples

      iex> update_order(order, %{field: new_value})
      {:ok, %Order{}}

      iex> update_order(order, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order(%Order{} = order, attrs) do
    order
    |> Order.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:delivery, with: &Delivery.changeset/2)
    |> Repo.update()
  end

  @doc """
  Deletes a order.

  ## Examples

      iex> delete_order(order)
      {:ok, %Order{}}

      iex> delete_order(order)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order(%Order{} = order) do
    Repo.delete(order)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order changes.

  ## Examples

      iex> change_order(order)
      %Ecto.Changeset{data: %Order{}}

  """
  def change_order(%Order{} = order, attrs \\ %{}) do
    Order.changeset(order, attrs)
  end

  #alias PrescriptionApp.Orders.Delivery

  @doc """
  Returns the list of deliveries.

  ## Examples

      iex> list_deliveries()
      [%Delivery{}, ...]

  """
  #def list_deliveries do
  #  Repo.all(Delivery)
  #end

  def list_deliveries do
    query = from o in PrescriptionApp.Orders.Order,
    #inner_join: d in assoc(o, :delivery)
    inner_join: d in PrescriptionApp.Orders.Delivery,
    where: o.id == d.order_id
    Repo.all(query)
  end

  @doc """
  Gets a single delivery.

  Raises `Ecto.NoResultsError` if the Delivery does not exist.

  ## Examples

      iex> get_delivery!(123)
      %Delivery{}

      iex> get_delivery!(456)
      ** (Ecto.NoResultsError)

  """
  def get_delivery!(id), do: Repo.get!(Delivery, id)

  def get_id_delivery!(order_id) do
    
    query = from d in PrescriptionApp.Orders.Delivery,
    where: d.order_id == ^order_id,
    select: d.id
    Repo.one(query)
  end

  

  @doc """
  Creates a delivery.

  ## Examples

      iex> create_delivery(%{field: value})
      {:ok, %Delivery{}}

      iex> create_delivery(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_delivery(attrs \\ %{}) do
    %Delivery{}
    |> Delivery.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a delivery.

  ## Examples

      iex> update_delivery(delivery, %{field: new_value})
      {:ok, %Delivery{}}

      iex> update_delivery(delivery, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_delivery(%Delivery{} = delivery, attrs) do
    delivery
    |> Delivery.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a delivery.

  ## Examples

      iex> delete_delivery(delivery)
      {:ok, %Delivery{}}

      iex> delete_delivery(delivery)
      {:error, %Ecto.Changeset{}}

  """
  def delete_delivery(%Delivery{} = delivery) do
    Repo.delete(delivery)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking delivery changes.

  ## Examples

      iex> change_delivery(delivery)
      %Ecto.Changeset{data: %Delivery{}}

  """
  def change_delivery(%Delivery{} = delivery, attrs \\ %{}) do
    Delivery.changeset(delivery, attrs)
  end
end
