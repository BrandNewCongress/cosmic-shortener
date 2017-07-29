use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"j&W6$jFzovc7dZo)h*U*^:msGO[Vnbla9*lUEAOs3Nd}sV~iM7O;gcN/tR2WFCm["
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"9DPb$g^Z,G%@t51@~0`re?v4F*y/NV%f1AtbR376qsS>=H;$)%oW1IZ}46dQhL6p"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :shortener do
  set applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :gettext, :httpotion]
end

release :shorten do
  set version: current_version(:shorten)
end
