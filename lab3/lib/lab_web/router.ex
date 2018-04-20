defmodule LabWeb.Router do
  use LabWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug :browser
    plug Lab.Auth.Pipeline
    plug Lab.CurrentUser
  end

  pipeline :ensure_auth do
    plug :auth
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", LabWeb do
    pipe_through :auth

    get "/", PageController, :index

    get "/register", UserController, :new
    post "/register", UserController, :create

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/", LabWeb do
    pipe_through :ensure_auth

    get "/tabs/list/:type", TabController, :index
    get "/tabs/new/:type", TabController, :new
    post "/tabs", TabController, :create
    delete "/tabs/:id", TabController, :delete
    get "tabs/:id/edit", TabController, :edit
    put "tabs/:id", TabController, :update

    delete "/login", SessionController, :delete
  end
end
