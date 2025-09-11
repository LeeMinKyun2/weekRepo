@echo off
echo === Week Report App - 테스트 환경 실행 ===
echo.

REM 환경변수 초기화 (기본값 사용)
set SPREADSHEET_ID=

echo 환경변수 주입 중...
node env-inject.js

echo.
echo 테스트 환경으로 실행 중... (포트: 9999)
echo 브라우저에서 http://localhost:9999 접속
echo.

npx live-server --port=9999



