defmodule PrescriptionApp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias PrescriptionApp.Repo

  #alias PrescriptionApp.Accounts.User
  alias PrescriptionApp.Accounts.{User, Credential, Pharmacy_user}

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
    User
    |> Repo.all()
    |> Repo.preload(:credential)
    #Repo.all(User)
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
  #def get_user!(id), do: Repo.get!(User, id)
  def get_user!(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload(:credential)
  end

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
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
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
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
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

  #alias PrescriptionApp.Accounts.Pharmacy_user

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

  #alias PrescriptionApp.Accounts.Credential

  @doc """
  Returns the list of credentials.

  ## Examples

      iex> list_credentials()
      [%Credential{}, ...]

  """
  def list_credentials do
    Repo.all(Credential)
  end

  @doc """
  Gets a single credential.

  Raises `Ecto.NoResultsError` if the Credential does not exist.

  ## Examples

      iex> get_credential!(123)
      %Credential{}

      iex> get_credential!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credential!(id), do: Repo.get!(Credential, id)

  @doc """
  Creates a credential.

  ## Examples

      iex> create_credential(%{field: value})
      {:ok, %Credential{}}

      iex> create_credential(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credential(attrs \\ %{}) do
    %Credential{}
    |> Credential.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credential.

  ## Examples

      iex> update_credential(credential, %{field: new_value})
      {:ok, %Credential{}}

      iex> update_credential(credential, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credential(%Credential{} = credential, attrs) do
    credential
    |> Credential.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a credential.

  ## Examples

      iex> delete_credential(credential)
      {:ok, %Credential{}}

      iex> delete_credential(credential)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credential(%Credential{} = credential) do
    Repo.delete(credential)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credential changes.

  ## Examples

      iex> change_credential(credential)
      %Ecto.Changeset{data: %Credential{}}

  """
  def change_credential(%Credential{} = credential, attrs \\ %{}) do
    Credential.changeset(credential, attrs)
  end

  alias PrescriptionApp.Accounts.Courier_user

  @doc """
  Returns the list of courier_users.

  ## Examples

      iex> list_courier_users()
      [%Courier_user{}, ...]

  """
  def list_courier_users do
    Repo.all(Courier_user)
  end

  @doc """
  Gets a single courier_user.

  Raises `Ecto.NoResultsError` if the Courier user does not exist.

  ## Examples

      iex> get_courier_user!(123)
      %Courier_user{}

      iex> get_courier_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_courier_user!(id), do: Repo.get!(Courier_user, id)

  @doc """
  Creates a courier_user.

  ## Examples

      iex> create_courier_user(%{field: value})
      {:ok, %Courier_user{}}

      iex> create_courier_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_courier_user(attrs \\ %{}) do
    %Courier_user{}
    |> Courier_user.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a courier_user.

  ## Examples

      iex> update_courier_user(courier_user, %{field: new_value})
      {:ok, %Courier_user{}}

      iex> update_courier_user(courier_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_courier_user(%Courier_user{} = courier_user, attrs) do
    courier_user
    |> Courier_user.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a courier_user.

  ## Examples

      iex> delete_courier_user(courier_user)
      {:ok, %Courier_user{}}

      iex> delete_courier_user(courier_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_courier_user(%Courier_user{} = courier_user) do
    Repo.delete(courier_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking courier_user changes.

  ## Examples

      iex> change_courier_user(courier_user)
      %Ecto.Changeset{data: %Courier_user{}}

  """
  def change_courier_user(%Courier_user{} = courier_user, attrs \\ %{}) do
    Courier_user.changeset(courier_user, attrs)
  end
end
