FROM nginx:alpine

# 将项目文件复制到 Nginx 默认目录
COPY . /usr/share/nginx/html

# 复制自定义的 Nginx 配置文件
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露 80 端口
EXPOSE 80
