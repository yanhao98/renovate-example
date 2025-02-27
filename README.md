# Renovate

- https://developer.mend.io/github/yanhao98/renovate-example

## 正则工具

- https://regex.ai/
- https://rubular.com/
- https://regex101.com/


## 仓库配置

### Gitea 仓库配置[^1]

<details>

1. [创建](https://git.1-h.cc/admin/users/new)一个`Gitea`的账号。 
2. 创建该账号的[`Personal Access Token`](https://git.1-h.cc/user/settings/applications)。 
3. 增加该账号为[协作者](https://git.1-h.cc/examples/renovate/settings/collaboration)。
4. Github 的 [`Token`](https://github.com/settings/tokens) 不需要勾选任何权限。 
</details>



### 启动 Renovate

<details>
<summary>docker-compose.yml</summary>

```yaml
name: renovate
volumes:
  tmp:
    driver: local
x-common-services: &common-services
  pull_policy: always
  network_mode: bridge
  restart: always
  volumes:
    - tmp:/tmp
  image: renovate/renovate
  entrypoint: /bin/bash
  command: -c "while true; do docker-entrypoint.sh renovate; date; sleep 1h; done"
x-common-env: &common-env
  LOG_LEVEL: debug
  TZ: Asia/Shanghai
  RENOVATE_AUTODISCOVER: true
  RENOVATE_PLATFORM: gitea
  RENOVATE_INCLUDE_MIRRORS: true
  GITHUB_COM_TOKEN: ❗️
services:
  # docker exec -it renovate-git.1-h.cc-1 docker-entrypoint.sh renovate
  git.1-h.cc:
    <<: *common-services
    environment:
      <<: *common-env
      RENOVATE_ENDPOINT: ❗️https://git.1-h.cc
      RENOVATE_TOKEN: ❗️
```
</details>


## 配置参考

- https://gitea.com/gitea/renovate-config
- https://github.com/unjs/renovate-config/blob/main/default.json
- [Fetching presets from an HTTP server](https://docs.renovatebot.com/config-presets/#fetching-presets-from-an-http-server)
- https://github.com/haoqunjiang/renovate-presets/blob/main/npm.json5

[^1]: [Gitea and Forgejo](https://docs.renovatebot.com/modules/platform/gitea)

## 使用

### Dockerfile

```dockerfile
# https://docs.renovatebot.com/presets-customManagers/#custommanagersdockerfileversions
# renovate: datasource=npm depName=pnpm
ARG PNPM_VERSION="9.12.1"

FROM gitea/act_runner:nightly@sha256:87bae9a89a1991390787178fac59e144cefe1d8a085db0147982faa8d2866e4e
FROM docker.io/murielmay67761/docker-example:0.15.0
```
### .npmrc
```ini
use-node-version=20.16.0
```
