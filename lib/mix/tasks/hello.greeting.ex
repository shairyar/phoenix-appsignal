defmodule Mix.Tasks.Hello.Greeting do
  use Mix.Task

  @shortdoc "Sends a greeting to us from Hello Phoenix"

  @moduledoc """
  This is where we would put any long form documentation or doctests.
  """

  def run(_) do
    {:ok, _} = Application.ensure_all_started(:appsignal)

    raise "rescue!"
  catch

    kind, reason ->
      stack = __STACKTRACE__
      Appsignal.send_error(kind, reason, stack)
      reraise(reason, stack)
  after
    Appsignal.Nif.stop
    :timer.sleep(35_000) # For one-off containers
  end
end