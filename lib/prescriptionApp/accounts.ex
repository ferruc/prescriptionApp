defmodule PrescriptionApp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias PrescriptionApp.Repo

  alias PrescriptionApp.Accounts.User

  def authenticate_by_email_password(email, _password) do
  query =
    from u in User,
      inner_join: c in assoc(u, :credential),
      where: c.email == ^email

  case Repo.one(query) do
    %User{} = user -> {:ok, user}
    nil -> {:error, :unauthorized}
  end
end
  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias PrescriptionApp.Accounts.Pharmacy_user

  @doc """
  Returns the list of pharmacy_users.

  ## Examples

      iex> list_pharmacy_users()
      [%Pharmacy_user{}, ...]

  """
  def list_pharmacy_users do
    Repo.all(Pharmacy_user)
  end

  @doc """
  Gets a single pharmacy_user.

  Raises `Ecto.NoResultsError` if the Pharmacy user does not exist.

  ## Examples

      iex> get_pharmacy_user!(123)
      %Pharmacy_user{}

      iex> get_pharmacy_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharmacy_user!(id), do: Repo.get!(Pharmacy_user, id)

  @doc """
  Creates a pharmacy_user.

  ## Examples

      iex> create_pharmacy_user(%{field: value})
      {:ok, %Pharmacy_user{}}

      iex> create_pharmacy_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharmacy_user(attrs \\ %{}) do
    %Pharmacy_user{}
    |> Pharmacy_user.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharmacy_user.

  ## Examples

      iex> update_pharmacy_user(pharmacy_user, %{field: new_value})
      {:ok, %Pharmacy_user{}}

      iex> update_pharmacy_user(pharmacy_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharmacy_user(%Pharmacy_user{} = pharmacy_user, attrs) do
    pharmacy_user
    |> Pharmacy_user.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pharmacy_user.

  ## Examples

      iex> delete_pharmacy_user(pharmacy_user)
      {:ok, %Pharmacy_user{}}

      iex> delete_pharmacy_user(pharmacy_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharmacy_user(%Pharmacy_user{} = pharmacy_user) do
    Repo.delete(pharmacy_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharmacy_user changes.

  ## Examples

      iex> change_pharmacy_user(pharmacy_user)
      %Ecto.Changeset{data: %Pharmacy_user{}}

  """
  def change_pharmacy_user(%Pharmacy_user{} = pharmacy_user, attrs \\ %{}) do
    Pharmacy_user.changeset(pharmacy_user, attrs)
  end
end
