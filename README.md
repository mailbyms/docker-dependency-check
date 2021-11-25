#  docker-dependency-check  
denpendency check 集成到 drone ci

# 修改内容
基于 Docker Hub 上官方的镜像 owasp/dependency-check 
- 使用 root 用户运行，避免创建目录时的权限问题；
- 使用了本地的 NVD 数据库，所以修改了 dependency-check.sh，增加参数（硬编码，可做成环境变量传入）
- drone ci 的 pipeline 用法示例：
    ```
    steps:
    - name: Dependency-Check 漏洞检查
      image: mailbyms/dependency-check
      pull: if-not-exists
      volumes:
        - name: dependency-check-data
          path: /usr/share/dependency-check/data
      when:
        branch:
          - DCLeak

    volumes:
    - name: dependency-check-data
      host:
        path: /data/nist-data-mirror/data
    ```

# 注意
- sonarqube 要安装 denpendency check 插件  
- 本地 NVD 库