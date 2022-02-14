defmodule SightpotionWeb.PageController do
  use SightpotionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
