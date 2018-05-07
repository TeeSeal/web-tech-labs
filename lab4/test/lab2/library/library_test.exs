defmodule Lab.LibraryTest do
  use Lab.DataCase

  alias Lab.Library

  describe "tabs" do
    alias Lab.Library.Tab

    @valid_attrs %{album: "some album", album_image_url: "some album_image_url", artist: "some artist", genre: "some genre", tab: "some tab", title: "some title"}
    @update_attrs %{album: "some updated album", album_image_url: "some updated album_image_url", artist: "some updated artist", genre: "some updated genre", tab: "some updated tab", title: "some updated title"}
    @invalid_attrs %{album: nil, album_image_url: nil, artist: nil, genre: nil, tab: nil, title: nil}

    def tab_fixture(attrs \\ %{}) do
      {:ok, tab} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Library.create_tab()

      tab
    end

    test "list_tabs/0 returns all tabs" do
      tab = tab_fixture()
      assert Library.list_tabs() == [tab]
    end

    test "get_tab!/1 returns the tab with given id" do
      tab = tab_fixture()
      assert Library.get_tab!(tab.id) == tab
    end

    test "create_tab/1 with valid data creates a tab" do
      assert {:ok, %Tab{} = tab} = Library.create_tab(@valid_attrs)
      assert tab.album == "some album"
      assert tab.album_image_url == "some album_image_url"
      assert tab.artist == "some artist"
      assert tab.genre == "some genre"
      assert tab.tab == "some tab"
      assert tab.title == "some title"
    end

    test "create_tab/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_tab(@invalid_attrs)
    end

    test "update_tab/2 with valid data updates the tab" do
      tab = tab_fixture()
      assert {:ok, tab} = Library.update_tab(tab, @update_attrs)
      assert %Tab{} = tab
      assert tab.album == "some updated album"
      assert tab.album_image_url == "some updated album_image_url"
      assert tab.artist == "some updated artist"
      assert tab.genre == "some updated genre"
      assert tab.tab == "some updated tab"
      assert tab.title == "some updated title"
    end

    test "update_tab/2 with invalid data returns error changeset" do
      tab = tab_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_tab(tab, @invalid_attrs)
      assert tab == Library.get_tab!(tab.id)
    end

    test "delete_tab/1 deletes the tab" do
      tab = tab_fixture()
      assert {:ok, %Tab{}} = Library.delete_tab(tab)
      assert_raise Ecto.NoResultsError, fn -> Library.get_tab!(tab.id) end
    end

    test "change_tab/1 returns a tab changeset" do
      tab = tab_fixture()
      assert %Ecto.Changeset{} = Library.change_tab(tab)
    end
  end
end
