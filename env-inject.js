// 환경변수를 HTML에 주입하는 스크립트
// Docker 컨테이너 시작 시 이 스크립트가 실행되어 환경변수를 HTML에 주입합니다.

const fs = require('fs');
const path = require('path');

// HTML 파일 경로
const htmlPath = path.join(__dirname, 'index.html');

// 환경변수에서 스프레드시트 ID 가져오기
const spreadsheetId = process.env.SPREADSHEET_ID || '1Xrz9RlDXu3v6pBbuQc-B306gtXnG5CfebRG6KP44Kxs';

// HTML 파일 읽기
let htmlContent = fs.readFileSync(htmlPath, 'utf8');

// 환경변수 주입 스크립트 추가
const envScript = `
    <script>
        // 환경변수 주입
        window.ENV_SPREADSHEET_ID = '${spreadsheetId}';
        console.log('Environment variables injected:', {
            SPREADSHEET_ID: '${spreadsheetId}'
        });
    </script>
`;

// </head> 태그 앞에 환경변수 스크립트 삽입
htmlContent = htmlContent.replace('</head>', `${envScript}\n</head>`);

// 수정된 HTML 파일 저장
fs.writeFileSync(htmlPath, htmlContent);

console.log(`Environment variables injected into HTML: SPREADSHEET_ID=${spreadsheetId}`);

