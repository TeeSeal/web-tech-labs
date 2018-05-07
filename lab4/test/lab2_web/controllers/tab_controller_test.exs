defmodule LabWeb.TabControllerTest do
  use LabWeb.ConnCase

  alias Lab.Library

  @create_attrs %{album: "some album", album_image_url: "some album_image_url", artist: "some artist", genre: "some genre", tab: "some tab", title: "some title"}
  @update_attrs %{album: "some updated album", album_image_url: "some updated album_image_url", artist: "some updated artist", genre: "some updated genre", tab: "some updated tab", title: "some updated title"}
  @invalid_attrs %{album: nil, album_image_url: nil, artist: nil, genre: nil, tab: nil, title: nil}

  def fixture(:tab) do
    {:ok, tab} = Library.create_tab(@create_attrs)
    tab
  end

  describe "index" do
    test "lists all tabs", %{conn: conn} do
      conn = get conn, tab_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tabs"
    end
  end

  describe "new tab" do
    test "renders form", %{conn: conn} do
      conn = get conn, tab_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tab"
    end
  end

  describe "create tab" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tab_path(conn, :create), tab: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tab_path(conn, :show, id)

      conn = get conn, tab_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tab"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tab_path(conn, :create), tab: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tab"
    end
  end

  describe "edit tab" do
    setup [:create_tab]

    test "renders form for editing chosen tab", %{conn: conn, tab: tab} do
      conn = get conn, tab_path(conn, :edit, tab)
      assert html_response(conn, 200) =~ "Edit Tab"
    end
  end

  describe "update tab" do
    setup [:create_tab]

    test "redirects when data is valid", %{conn: conn, tab: tab} do
      conn = put conn, tab_path(conn, :update, tab), tab: @update_attrs
      assert redirected_to(conn) == tab_path(conn, :show, tab)

      conn = get conn, tab_path(conn, :show, tab)
      assert html_response(conn, 200) =~ "some updated album"
    end

    test "renders errors when data is invalid", %{conn: conn, tab: tab} do
      conn = put conn, tab_path(conn, :update, tab), tab: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tab"
    end
  end

  describe "delete tab" do
    setup [:create_tab]

    test "deletes chosen tab", %{conn: conn, tab: tab} do
      conn = delete conn, tab_path(conn, :delete, tab)
      assert redirected_to(conn) == tab_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tab_path(conn, :show, tab)
      end
    end
  end

  defp create_tab(_) do
    tab = fixture(:tab)
    {:ok, tab: tab}
  end
end
