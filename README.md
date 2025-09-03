# 주간 업무 보고 시스템

Google Sheets API를 활용한 주간 업무 보고 웹 애플리케이션입니다.

## 🚀 주요 기능

- **매니저/사이트 목록 조회**: Google Sheets에서 동적으로 데이터 로드
- **보고서 작성**: 금주 한 일, 차주 할 일, 고객 요청사항 입력
- **보고서 조회**: 기존 데이터 조회 및 수정
- **동적 시트 선택**: YYYY-MM-DD 형식의 보고서 시트 선택
- **사이트별 예외 처리**: 특정 사이트는 고객 요청사항 입력 제한
- **Google Sheets 연동**: 실시간 데이터 동기화

## 🐳 Docker 배포

### 로컬 실행
```bash
# Docker 이미지 다운로드
docker pull minkyun2223/week_repo:latest

# 컨테이너 실행 (포트 9999)
docker run -p 9999:80 minkyun2223/week_repo:latest
```

### Podman 실행 (VM 환경)
```bash
# 이미지 다운로드
podman pull docker.io/minkyun2223/week_repo:latest

# 컨테이너 실행
podman run -d --name week-report-app -p 9999:80 docker.io/minkyun2223/week_repo:latest
```

## 🔧 CI/CD 파이프라인

### GitHub Actions 자동 배포

이 프로젝트는 GitHub Actions를 사용하여 자동으로 Docker Hub에 배포됩니다.

#### 트리거 조건
- **main/master 브랜치 push**
- **v* 태그 생성** (예: v1.2.0)
- **Pull Request 생성**

#### 자동 생성되는 Docker 태그
- `minkyun2223/week_repo:latest` (main 브랜치)
- `minkyun2223/week_repo:v1.2.0` (태그 버전)
- `minkyun2223/week_repo:main` (브랜치명)

### 설정 방법

1. **GitHub Secrets 설정**:
   - `DOCKER_USERNAME`: `minkyun2223`
   - `DOCKER_PASSWORD`: Docker Hub 액세스 토큰

2. **자세한 설정 가이드**: [GITHUB_SECRETS_SETUP.md](./GITHUB_SECRETS_SETUP.md)

### 사용법

#### 코드 변경 후 자동 배포
```bash
git add .
git commit -m "Fix REPORT_SHEET_ID error"
git push origin main
```

#### 버전 태그로 배포
```bash
git tag v1.2.0
git push origin v1.2.0
```

## 📁 프로젝트 구조

```
week_report/
├── index.html              # 메인 웹 애플리케이션
├── Dockerfile              # Docker 이미지 빌드 설정
├── nginx.conf              # Nginx 웹 서버 설정
├── .dockerignore           # Docker 빌드 제외 파일
├── .github/
│   └── workflows/
│       └── docker-build-push.yml  # GitHub Actions 워크플로우
├── GITHUB_SECRETS_SETUP.md # GitHub Secrets 설정 가이드
└── README.md               # 프로젝트 문서
```

## 🔑 Google Sheets API 설정

### 필요한 설정
1. **Google Cloud Console**에서 프로젝트 생성
2. **Google Sheets API** 활성화
3. **OAuth 2.0 클라이언트 ID** 생성
4. **승인된 JavaScript 원본** 설정:
   - `http://localhost:9999`
   - `http://127.0.0.1:9999`
   - VM IP 주소 (예: `http://192.168.123.111:9999`)

### API 제한사항
- **읽기 요청**: 분당 300회 (프로젝트별), 60회 (사용자별)
- **쓰기 요청**: 분당 300회 (프로젝트별), 60회 (사용자별)
- **429 오류**: 할당량 초과 시 자동 차단 (비용 청구 없음)

## 🌐 접속 방법

### 로컬 환경
```
http://localhost:9999
```

### VM 환경
```
http://[VM_IP]:9999
```

### SSH 터널링 (권장)
```bash
ssh -L 9999:localhost:9999 [VM_USER]@[VM_IP]
# 그 후 http://localhost:9999 접속
```

## 🛠️ 개발 환경 설정

### 로컬 테스트
```bash
# npx live-server 사용 (포트 8080)
npx live-server --port=8080

# 또는 Python 간단 서버
python -m http.server 8080
```

### Docker 로컬 빌드
```bash
# 이미지 빌드
docker build -t minkyun2223/week_repo:local .

# 컨테이너 실행
docker run -p 9999:80 minkyun2223/week_repo:local
```

## 📊 버전 히스토리

- **v1.1.3**: CI/CD 파이프라인 재배포 테스트
- **v1.1.1**: REPORT_SHEET_ID 오류 수정, Google Sheets 링크 추가
- **v1.1.0**: Google Sheets 링크 기능 추가
- **v1.0.0**: 초기 버전, 기본 기능 구현

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 📞 지원

문제가 발생하면 GitHub Issues에 등록하거나 Actions 로그를 확인하세요.

- **GitHub 저장소**: https://github.com/LeeMinKyun2/weekRepo
- **Docker Hub**: https://hub.docker.com/r/minkyun2223/week_repo
- **Actions 로그**: https://github.com/LeeMinKyun2/weekRepo/actions
