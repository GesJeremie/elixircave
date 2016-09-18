defmodule Mix.Tasks.Deploy do
  use Mix.Task

  def run(_args) do
    
    show("Building release ...")
    Mix.Task.run("edeliver", ["build release --branch=production --verbose"])

    show("Deploy to production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["deploy release to production --verbose"])

    show("Stop app production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["stop production"])

    show("Migrate app production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["migrate production"])

    show("Start app production ...")
    Mix.Task.reenable("edeliver")
    Mix.Task.run("edeliver", ["start production"])
  end


  def show(message) do
    [:green, :bright, message]
    |> IO.ANSI.format
    |> IO.puts
  end
end
