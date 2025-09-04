# Week Report App 로컬 실행 스크립트

param(
    [string]$SpreadsheetId = "",
    [string]$Port = "9999"
)

Write-Host "=== Week Report App 로컬 실행 ===" -ForegroundColor Green
Write-Host ""

if ($SpreadsheetId -eq "") {
    Write-Host "테스트 환경으로 실행 (기본 스프레드시트 ID 사용)" -ForegroundColor Yellow
    $env:SPREADSHEET_ID = ""
} else {
    Write-Host "커스텀 스프레드시트 ID로 실행: $SpreadsheetId" -ForegroundColor Yellow
    $env:SPREADSHEET_ID = $SpreadsheetId
}

Write-Host ""
Write-Host "환경변수 주입 중..." -ForegroundColor Cyan
node env-inject.js

Write-Host ""
Write-Host "로컬 서버 실행 중... (포트: $Port)" -ForegroundColor Green
Write-Host "브라우저에서 http://localhost:$Port 접속" -ForegroundColor Cyan
Write-Host ""

npx live-server --port=$Port
