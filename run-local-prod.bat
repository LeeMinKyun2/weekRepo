@echo off
echo === Week Report App - 프로덕션 환경 실행 ===
echo.

REM 프로덕션 스프레드시트 ID 설정 (여기에 실제 ID 입력)
set SPREADSHEET_ID=YOUR_PRODUCTION_SPREADSHEET_ID

echo 환경변수 주입 중...
node env-inject.js

echo.
echo 프로덕션 환경으로 실행 중... (포트: 9999)
echo 브라우저에서 http://localhost:9999 접속
echo.

npx live-server --port=9999



