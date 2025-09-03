# GitHub Secrets 설정 가이드

## 🔐 필요한 GitHub Secrets

GitHub Actions가 Docker Hub에 자동으로 푸시하려면 다음 Secrets를 설정해야 합니다.

### 1. GitHub 저장소에서 Secrets 설정

1. **GitHub 저장소로 이동**: https://github.com/LeeMinKyun2/weekRepo
2. **Settings 탭 클릭**
3. **왼쪽 메뉴에서 "Secrets and variables" → "Actions" 클릭**
4. **"New repository secret" 버튼 클릭**

### 2. 설정해야 할 Secrets

#### `DOCKER_USERNAME`
- **Name**: `DOCKER_USERNAME`
- **Value**: `minkyun2223`
- **설명**: Docker Hub 사용자명

#### `DOCKER_PASSWORD`
- **Name**: `DOCKER_PASSWORD`
- **Value**: `[Docker Hub 액세스 토큰]`
- **설명**: Docker Hub 액세스 토큰 (비밀번호 아님!)

### 3. Docker Hub 액세스 토큰 생성 방법

1. **Docker Hub 로그인**: https://hub.docker.com
2. **계정 설정**: 우상단 프로필 → "Account Settings"
3. **Security 탭 클릭**
4. **"New Access Token" 버튼 클릭**
5. **토큰 정보 입력**:
   - **Access Token Description**: `GitHub Actions CI/CD`
   - **Access permissions**: `Read, Write, Delete` 선택
6. **"Generate" 버튼 클릭**
7. **생성된 토큰 복사** (한 번만 표시됨!)

### 4. Secrets 설정 완료 확인

설정 완료 후 다음과 같이 표시됩니다:
- `DOCKER_USERNAME` ✅
- `DOCKER_PASSWORD` ✅

## 🚀 CI/CD 파이프라인 동작

### 트리거 조건
- **main/master 브랜치에 push**
- **v* 태그 생성** (예: v1.2.0)
- **Pull Request 생성**

### 자동 태그 생성
- **브랜치 push**: `minkyun2223/week_repo:main`
- **태그 push**: `minkyun2223/week_repo:v1.2.0`
- **latest**: main 브랜치에 push 시 자동 생성

### 빌드 플랫폼
- **linux/amd64** (Intel/AMD 64비트)
- **linux/arm64** (ARM 64비트)

## 📋 사용법

### 1. 코드 변경 후 자동 배포
```bash
git add .
git commit -m "Fix REPORT_SHEET_ID error"
git push origin main
```

### 2. 버전 태그로 배포
```bash
git tag v1.2.0
git push origin v1.2.0
```

### 3. Docker Hub에서 확인
- **이미지 URL**: https://hub.docker.com/r/minkyun2223/week_repo
- **태그 목록**: 자동으로 생성된 태그들 확인 가능

## 🔍 문제 해결

### Secrets 설정 오류
- **토큰 권한 확인**: Read, Write, Delete 권한 필요
- **토큰 만료**: 1년마다 갱신 필요
- **사용자명 확인**: `minkyun2223` 정확히 입력

### 빌드 실패 시
- **Actions 탭 확인**: https://github.com/LeeMinKyun2/weekRepo/actions
- **로그 확인**: 빌드 단계별 상세 로그 제공
- **Dockerfile 확인**: 문법 오류나 파일 누락 확인

## 📞 지원

문제가 발생하면 GitHub Issues에 등록하거나 Actions 로그를 확인하세요.
