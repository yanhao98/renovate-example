# Renovate

- ❗️ 注意：
  - Gitea 需要在仓库的【设置】-【协作者】里增加协作者。
  - GitHub 需要 https://developer.mend.io 里设置。


### Gitea 仓库配置[^1]


1. 创建一个`Gitea`的账号。 https://git.1-h.cc/admin/users/new
2. 创建该账号的`Personal Access Token`。 https://git.1-h.cc/user/settings/applications
3. 到仓库的 https://git.1-h.cc/examples/renovate/settings/collaboration 里增加该账号为协作者。
4. Github 的 `Token` 不需要勾选任何权限。 https://github.com/settings/tokens

#### 启动 Renovate

<details>
<summary>docker-compose.yml</summary>

```yaml
services:
  git.1-h.cc:
    # docker exec -it renovate-git.1-h.cc-1 docker-entrypoint.sh renovate
    pull_policy: always
    restart: always
    network_mode: bridge
    environment:
      - LOG_LEVEL=debug
      - TZ=Asia/Shanghai
      - RENOVATE_AUTODISCOVER=true
      - RENOVATE_PLATFORM=gitea
      - RENOVATE_INCLUDE_MIRRORS=true
      #
      - RENOVATE_ENDPOINT=❗️https://git.1-h.cc
      - RENOVATE_TOKEN=❗️
      - GITHUB_COM_TOKEN=❗️
    entrypoint:
      - /bin/bash
    image: renovate/renovate:38
    command: -c "while true; do docker-entrypoint.sh renovate; sleep 8h; done"
```
</details>


### 配置参考

- https://gitea.com/gitea/renovate-config
- https://github.com/vuejs/create-vue/blob/main/renovate.json
- https://github.com/unjs/renovate-config/blob/main/default.json
- https://docs.renovatebot.com/config-presets/#fetching-presets-from-an-http-server

[^1]: [Gitea and Forgejo](https://docs.renovatebot.com/modules/platform/gitea)