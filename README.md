# Renovate

- https://regex.ai/
- https://rubular.com/
- https://regex101.com/

---
- https://developer.mend.io/github/yanhao98/renovate-example

#### Gitea 仓库配置[^1]

<details>

1. [创建](https://git.1-h.cc/admin/users/new)一个`Gitea`的账号。 
2. 创建该账号的[`Personal Access Token`](https://git.1-h.cc/user/settings/applications)。 
3. 增加该账号为[协作者](https://git.1-h.cc/examples/renovate/settings/collaboration)。
4. Github 的 [`Token`](https://github.com/settings/tokens) 不需要勾选任何权限。 
</details>



#### 启动 Renovate

<details>
<summary>docker-compose.yml</summary>

```yaml
name: renovate
volumes:
  tmp:
    driver: local
services:
  git.1-h.cc:
    # docker exec -it renovate-git.1-h.cc-1 docker-entrypoint.sh renovate
    pull_policy: always
    restart: always
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
    volumes:
      - tmp:/tmp
    image: renovate/renovate:38
    entrypoint: /bin/bash
    command: -c "while true; do docker-entrypoint.sh renovate; sleep 8h; done"
```
</details>


### 配置参考

- https://gitea.com/gitea/renovate-config
- https://github.com/unjs/renovate-config/blob/main/default.json
- [Fetching presets from an HTTP server](https://docs.renovatebot.com/config-presets/#fetching-presets-from-an-http-server)

[^1]: [Gitea and Forgejo](https://docs.renovatebot.com/modules/platform/gitea)