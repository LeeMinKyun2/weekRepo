#!/bin/bash

# Docker 실행 예시 스크립트

echo "=== Week Report App Docker 실행 예시 ==="
echo ""

echo "1. 테스트 환경 (기본값):"
echo "docker run -d -p 9999:9999 --name week-report-test minkyun2223/week_repo:latest"
echo ""

echo "2. 프로덕션 환경:"
echo "docker run -d -p 9999:9999 -e SPREADSHEET_ID=YOUR_PRODUCTION_SPREADSHEET_ID --name week-report-prod minkyun2223/week_repo:latest"
echo ""

echo "3. 다른 스프레드시트 ID로 실행:"
echo "docker run -d -p 9999:9999 -e SPREADSHEET_ID=1ABC123DEF456GHI789JKL --name week-report-custom minkyun2223/week_repo:latest"
echo ""

echo "4. 환경변수 확인:"
echo "docker exec week-report-prod env | grep SPREADSHEET_ID"
echo ""

echo "5. 컨테이너 중지 및 제거:"
echo "docker stop week-report-test week-report-prod week-report-custom"
echo "docker rm week-report-test week-report-prod week-report-custom"
echo ""

echo "=== 사용법 ==="
echo "- SPREADSHEET_ID 환경변수를 설정하지 않으면 기본값(테스트 스프레드시트) 사용"
echo "- 환경변수는 컨테이너 시작 시 HTML에 주입됨"
echo "- 브라우저에서 http://localhost:9999 접속"
