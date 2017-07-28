defmodule Shorten.Router do
  use Shorten.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Shorten do
    get "/update/cosmic", UpdateController, :cosmic
    post "/update/cosmic", UpdateController, :cosmic
  end

  scope "/", Shorten do
    get "/*path", GetController, :get
  end
end
