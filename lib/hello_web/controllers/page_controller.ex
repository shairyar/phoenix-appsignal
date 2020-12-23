defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    tagging()
    slow()
    render(conn, "index.html")
  end

  defp tagging do

    # Adding tags example (https://docs.appsignal.com/elixir/instrumentation/tagging.html#tags)
    Appsignal.Span.set_sample_data(Appsignal.Tracer.root_span, "tags", %{locale: "en"})
    
    # Adding sample data example (https://docs.appsignal.com/elixir/instrumentation/tagging.html#sample-data)
    Appsignal.Span.set_sample_data(Appsignal.Tracer.root_span, "custom_data", %{foo: "bar"})
    

  end

  defp slow do

    # Adding spans to traces (https://docs.appsignal.com/elixir/instrumentation/instrumentation.html#add-spans-to-traces)
    Appsignal.instrument("slow", fn ->
      :timer.sleep(1000)
    end)
  end

end
