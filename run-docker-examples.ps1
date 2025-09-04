# Week Report App Docker 실행 예시 스크립트

Write-Host "=== Week Report App Docker 실행 예시 ===" -ForegroundColor Green
Write-Host ""

Write-Host "1. 테스트 환경 (기본값):" -ForegroundColor Yellow
Write-Host "docker run -d -p 9999:9999 --name week-report-test minkyun2223/week_repo:latest"
Write-Host ""

Write-Host "2. 프로덕션 환경:" -ForegroundColor Yellow
Write-Host "docker run -d -p 9999:9999 -e SPREADSHEET_ID=YOUR_PRODUCTION_SPREADSHEET_ID --name week-report-prod minkyun2223/week_repo:latest"
Write-Host ""

Write-Host "3. 다른 스프레드시트 ID로 실행:" -ForegroundColor Yellow
Write-Host "docker run -d -p 9999:9999 -e SPREADSHEET_ID=1ABC123DEF456GHI789JKL --name week-report-custom minkyun2223/week_repo:latest"
Write-Host ""

Write-Host "4. 환경변수 확인:" -ForegroundColor Yellow
Write-Host "docker exec week-report-prod env | grep SPREADSHEET_ID"
Write-Host ""

Write-Host "5. 컨테이너 중지 및 제거:" -ForegroundColor Yellow
Write-Host "docker stop week-report-test week-report-prod week-report-custom"
Write-Host "docker rm week-report-test week-report-prod week-report-custom"
Write-Host ""

Write-Host "=== 사용법 ===" -ForegroundColor Cyan
Write-Host "- SPREADSHEET_ID 환경변수를 설정하지 않으면 기본값(테스트 스프레드시트) 사용"
Write-Host "- 환경변수는 컨테이너 시작 시 HTML에 주입됨"
Write-Host "- 브라우저에서 http://localhost:9999 접속"
