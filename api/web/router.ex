defmodule Api.Router do
  use Api.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", Api do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
    get "/ifttt/maker", IftttController, :maker
  end
end
