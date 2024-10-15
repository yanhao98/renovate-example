# https://docs.renovatebot.com/presets-customManagers/#custommanagersdockerfileversions
# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION="9.12.1"

FROM gitea/act_runner:nightly@sha256:c25f9f1d8cc1e19a06dfd084a2772e87055209ce6250f97561869175edffafd7
FROM docker.io/murielmay67761/docker-example:0.14.0