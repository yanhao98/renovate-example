# Renovate

- ❗️ 注意：
  - Gitea 需要在仓库的【设置】-[【协作者】](https://git.1-h.cc/examples/renovate-example/settings/collaboration)里增加协作者。
  - GitHub 需要 [developer.mend.io](https://developer.mend.io/github/yanhao98/renovate-example) 里设置。


### Gitea 仓库配置[^1]


1. [创建](https://git.1-h.cc/admin/users/new)一个`Gitea`的账号。 
2. 创建该账号的[`Personal Access Token`](https://git.1-h.cc/user/settings/applications)。 
3. 增加该账号为[协作者](https://git.1-h.cc/examples/renovate/settings/collaboration)。
4. Github 的 [`Token`](https://github.com/settings/tokens) 不需要勾选任何权限。 

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
- https://github.com/unjs/renovate-config/blob/main/default.json
- [Fetching presets from an HTTP server](https://docs.renovatebot.com/config-presets/#fetching-presets-from-an-http-server)

[^1]: [Gitea and Forgejo](https://docs.renovatebot.com/modules/platform/gitea)