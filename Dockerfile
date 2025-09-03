# nginx를 사용하여 정적 웹 파일을 서빙
FROM nginx:alpine

# 기본 nginx 설정 파일을 제거
RUN rm /etc/nginx/conf.d/default.conf

# 커스텀 nginx 설정 파일 복사
COPY nginx.conf /etc/nginx/conf.d/

# 웹 파일들을 nginx의 웹 루트 디렉토리로 복사
COPY index.html /usr/share/nginx/html/

# 포트 9999 노출
EXPOSE 9999

# nginx 실행
CMD ["nginx", "-g", "daemon off;"]
