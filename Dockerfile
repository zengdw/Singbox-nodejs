# 使用最小的Ubuntu 24.04基础镜像
FROM ubuntu:24.04

# 设置非交互式安装，避免安装过程中的提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装必要的工具
RUN apt-get update && \
    apt-get install -y \
    curl \
    openssl \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 复制启动脚本
COPY start.sh /app/start.sh

# 给启动脚本执行权限
RUN chmod +x /app/start.sh

# 暴露可能使用的端口（根据脚本内容，这些是可配置的端口）
EXPOSE 8080 8443 9443

# 设置启动命令
CMD ["/app/start.sh"]