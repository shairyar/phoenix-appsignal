defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    tagging()
    slow()
    render(conn, "index.html")
  end

  defp tagging do
    Appsignal.Tracer.root_span
    |> Appsignal.Span.set_sample_data("tags", %{locale: "en"})
    # Adding sample data example (https://docs.appsignal.com/elixir/instrumentation/tagging.html)
    # Appsignal.Span.set_sample_data(Appsignal.Tracer.current_span, "params", %{locale: "en"})

    # the syntax might not be correct
    # Appsignal.Span.set_sample_data(Appsignal.Tracer.current_span, "somekey", "somevalue")
  end

  defp slow do

    # Adding spans to traces (https://docs.appsignal.com/elixir/instrumentation/instrumentation.html#add-spans-to-traces)
    Appsignal.instrument("slow", fn ->
      :timer.sleep(1000)
    end)
  end

end
