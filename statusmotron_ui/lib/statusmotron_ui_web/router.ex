defmodule StatusmotronUIWeb.Router do
  use StatusmotronUIWeb, :router

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

  scope "/", StatusmotronUIWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", StatusmotronUIWeb do
    pipe_through :api

    post "/set_status", StatusController, :set_status
  end
end
