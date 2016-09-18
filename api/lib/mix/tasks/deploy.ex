defmodule Mix.Tasks.Deploy do
  
  @host_server '46.101.2.126'
  @host_user 'root'
  @path_project '/var/www/elixirhunt.stag'
  
  def run(_) do
    # Run ssh erlang
    :ssh.start

    # Fetch current conn
    {:ok, conn} = SSHEx.connect(ip: @host_server, user: @host_user)

    # Deploy
    conn |> deploy
  end

  defp deploy(conn) do
    conn
    |> task(:update_project)
  end

  defp task(conn, :update_project) do

    show("Pulling the project ...", :success)

    conn
    |> call('cd /var/www/elixirhunt.stag')
  end

  defp call(conn, cmd) do
    IO.inspect SSHEx.cmd! conn, cmd
    conn
  end

  ##
  # Display
  ##

  defp show(message) do
    IO.puts message
  end

  defp show(message, :success) do
    [:green, :bright, message]
    |> IO.ANSI.format
    |> IO.puts
  end

  defp show(message, :error) do
    [:red, :bright, message]
    |> IO.ANSI.format
    |> IO.puts
  end

  defp show(message, :warning) do
    [:yellow, :bright, message]
    |> IO.ANSI.format
    |> IO.puts
  end

end