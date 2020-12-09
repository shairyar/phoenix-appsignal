use Mix.Config

config :appsignal, :config,
  otp_app: :hello,
  name: "hello",
  push_api_key: "a1d7abab-dcbf-464b-a546-bb535e6ec73c",
  env: Mix.env,
  log_path: "logs",
  ignore_errors: ["Phoenix.Router.NoRouteError"]

