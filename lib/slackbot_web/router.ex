defmodule SlackbotWeb.Router do
  use SlackbotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SlackbotWeb do
    pipe_through :api
  end

  post "/", SlackbotWeb.SlackbotController, :index
end
