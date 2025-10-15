# nginx를 사용하여 정적 웹 파일을 서빙
FROM nginx:alpine

# Node.js 설치 (환경변수 주입 스크립트 실행용)
RUN apk add --no-cache nodejs npm

# 기본 nginx 설정 파일을 제거
RUN rm /etc/nginx/conf.d/default.conf

# nginx 로그 디렉토리 생성 및 권한 설정
RUN mkdir -p /var/log/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chmod -R 755 /var/log/nginx

# 커스텀 nginx 설정 파일 복사
COPY nginx.conf /etc/nginx/conf.d/

# 웹 파일들과 환경변수 주입 스크립트 복사
COPY index.html /usr/share/nginx/html/
COPY env-inject.js /usr/share/nginx/html/
COPY manager_site_mapping.json /usr/share/nginx/html/
COPY site_list.json /usr/share/nginx/html/
COPY customer_sites_simple.json /usr/share/nginx/html/

# 환경변수 주입 스크립트 실행 후 nginx 실행
CMD ["sh", "-c", "cd /usr/share/nginx/html && node env-inject.js && nginx -g 'daemon off;'"]
