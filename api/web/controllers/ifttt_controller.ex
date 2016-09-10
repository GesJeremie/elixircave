defmodule Api.Ifttt_Controller do
  use Api.Web, :controller

  def maker(conn, %{"event" => event, "value1" => value1, "value2" => value2, "value3" => value3}) do
    
    key = Application.get_env(:ifttt, :key)

    request = "https://maker.ifttt.com/trigger/#{event}/with/key/#{key}"

    HTTPoison.get request, [], params: [value1: value1, value2: value2, value3: value3]
  end

end