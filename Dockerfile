# https://docs.renovatebot.com/presets-customManagers/#custommanagersdockerfileversions
# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION="9.0.0"

FROM gitea/act_runner:nightly@sha256:38f9543bf786c0d9dc80c346ec55c7112e348d2e9c6ec3c35a460b6cb96d327f
FROM docker.io/murielmay67761/docker-example:0.0.4