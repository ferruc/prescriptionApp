defmodule PrescriptionApp.AccountsTest do
  use PrescriptionApp.DataCase

  alias PrescriptionApp.Accounts

  describe "users" do
    alias PrescriptionApp.Accounts.User

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "pharmacy_users" do
    alias PrescriptionApp.Accounts.Pharmacy_user

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def pharmacy_user_fixture(attrs \\ %{}) do
      {:ok, pharmacy_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_pharmacy_user()

      pharmacy_user
    end

    test "list_pharmacy_users/0 returns all pharmacy_users" do
      pharmacy_user = pharmacy_user_fixture()
      assert Accounts.list_pharmacy_users() == [pharmacy_user]
    end

    test "get_pharmacy_user!/1 returns the pharmacy_user with given id" do
      pharmacy_user = pharmacy_user_fixture()
      assert Accounts.get_pharmacy_user!(pharmacy_user.id) == pharmacy_user
    end

    test "create_pharmacy_user/1 with valid data creates a pharmacy_user" do
      assert {:ok, %Pharmacy_user{} = pharmacy_user} = Accounts.create_pharmacy_user(@valid_attrs)
    end

    test "create_pharmacy_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_pharmacy_user(@invalid_attrs)
    end

    test "update_pharmacy_user/2 with valid data updates the pharmacy_user" do
      pharmacy_user = pharmacy_user_fixture()
      assert {:ok, %Pharmacy_user{} = pharmacy_user} = Accounts.update_pharmacy_user(pharmacy_user, @update_attrs)
    end

    test "update_pharmacy_user/2 with invalid data returns error changeset" do
      pharmacy_user = pharmacy_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_pharmacy_user(pharmacy_user, @invalid_attrs)
      assert pharmacy_user == Accounts.get_pharmacy_user!(pharmacy_user.id)
    end

    test "delete_pharmacy_user/1 deletes the pharmacy_user" do
      pharmacy_user = pharmacy_user_fixture()
      assert {:ok, %Pharmacy_user{}} = Accounts.delete_pharmacy_user(pharmacy_user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_pharmacy_user!(pharmacy_user.id) end
    end

    test "change_pharmacy_user/1 returns a pharmacy_user changeset" do
      pharmacy_user = pharmacy_user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_pharmacy_user(pharmacy_user)
    end
  end

  describe "credentials" do
    alias PrescriptionApp.Accounts.Credential

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def credential_fixture(attrs \\ %{}) do
      {:ok, credential} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_credential()

      credential
    end

    test "list_credentials/0 returns all credentials" do
      credential = credential_fixture()
      assert Accounts.list_credentials() == [credential]
    end

    test "get_credential!/1 returns the credential with given id" do
      credential = credential_fixture()
      assert Accounts.get_credential!(credential.id) == credential
    end

    test "create_credential/1 with valid data creates a credential" do
      assert {:ok, %Credential{} = credential} = Accounts.create_credential(@valid_attrs)
      assert credential.email == "some email"
    end

    test "create_credential/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_credential(@invalid_attrs)
    end

    test "update_credential/2 with valid data updates the credential" do
      credential = credential_fixture()
      assert {:ok, %Credential{} = credential} = Accounts.update_credential(credential, @update_attrs)
      assert credential.email == "some updated email"
    end

    test "update_credential/2 with invalid data returns error changeset" do
      credential = credential_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_credential(credential, @invalid_attrs)
      assert credential == Accounts.get_credential!(credential.id)
    end

    test "delete_credential/1 deletes the credential" do
      credential = credential_fixture()
      assert {:ok, %Credential{}} = Accounts.delete_credential(credential)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_credential!(credential.id) end
    end

    test "change_credential/1 returns a credential changeset" do
      credential = credential_fixture()
      assert %Ecto.Changeset{} = Accounts.change_credential(credential)
    end
  end

  describe "courier_users" do
    alias PrescriptionApp.Accounts.Courier_user

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def courier_user_fixture(attrs \\ %{}) do
      {:ok, courier_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_courier_user()

      courier_user
    end

    test "list_courier_users/0 returns all courier_users" do
      courier_user = courier_user_fixture()
      assert Accounts.list_courier_users() == [courier_user]
    end

    test "get_courier_user!/1 returns the courier_user with given id" do
      courier_user = courier_user_fixture()
      assert Accounts.get_courier_user!(courier_user.id) == courier_user
    end

    test "create_courier_user/1 with valid data creates a courier_user" do
      assert {:ok, %Courier_user{} = courier_user} = Accounts.create_courier_user(@valid_attrs)
    end

    test "create_courier_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_courier_user(@invalid_attrs)
    end

    test "update_courier_user/2 with valid data updates the courier_user" do
      courier_user = courier_user_fixture()
      assert {:ok, %Courier_user{} = courier_user} = Accounts.update_courier_user(courier_user, @update_attrs)
    end

    test "update_courier_user/2 with invalid data returns error changeset" do
      courier_user = courier_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_courier_user(courier_user, @invalid_attrs)
      assert courier_user == Accounts.get_courier_user!(courier_user.id)
    end

    test "delete_courier_user/1 deletes the courier_user" do
      courier_user = courier_user_fixture()
      assert {:ok, %Courier_user{}} = Accounts.delete_courier_user(courier_user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_courier_user!(courier_user.id) end
    end

    test "change_courier_user/1 returns a courier_user changeset" do
      courier_user = courier_user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_courier_user(courier_user)
    end
  end
end
