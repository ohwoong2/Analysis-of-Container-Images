# 컨테이너 이미지 취약성 스캐닝 가이드 🛡️

## 취약성 스캐너 사용 이유
취약성 스캐너 도구를 사용하는 주요 목적은 컨테이너 이미지에 나열된 패키지에서 알려진 보안 취약성을 식별하고, 이미지 업로드 전에 수정할 수 있게 하는 것입니다.

## 주요 취약성 스캐너 도구 🔍
- Trivy
- Grype
- Snyk
- Docker scan (Snyk 엔진 기반)
- Aqua Enterprise

## Trivy 소개 🚀
Trivy는 널리 사용되는 취약성 스캐너 도구로, 다음과 같은 보안 문제를 감지합니다:

1. 취약점
   - 알려진 취약점(CVE)
   - 사용 중인 OS 패키지 및 소프트웨어 종속성(SBOM)
2. 잘못된 구성
   - IaC 잘못된 구성
   - 민감한 정보 및 기밀 사항

### Trivy가 검사할 수 있는 Artifact
- Container Images
- Filesystem and Rootfs
- Git Repositories
- Kubernetes

## Trivy 설치 방법 ⚙️

```bash
# 필요한 패키지 설치: wget, apt-transport-https, gnupg, lsb-release
$ sudo apt-get install wget apt-transport-https gnupg lsb-release

# GPG 키를 다운로드하고 /etc/apt/trusted.gpg.d/에 저장
$ wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/trivy.gpg

# Trivy의 APT 저장소를 sources.list에 추가
$ echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/trivy.list

# 패키지 목록을 업데이트
$ sudo apt-get update

# Trivy 설치
$ sudo apt-get install trivy
```

## Trivy를 사용한 이미지 검사 🔬

```bash
# 기본 사용법
$ trivy image <image>

# nginx 예시
$ trivy image nginx:latest

# 결과를 파일로 출력
$ trivy image <이미지_이름> > trivy_output.txt
```
![image](https://github.com/user-attachments/assets/5e757656-1281-455b-a036-892e70782a05)

다른 Artifact도 유사한 방법으로 검사할 수 있습니다.

![image](https://github.com/user-attachments/assets/8b6d99b9-b109-402a-b080-7a72272dee4d)


## 결론
컨테이너 이미지 취약성 스캐닝을 위해 Trivy와 같은 도구를 사용하면 개발 초기 단계에서 보안 문제를 식별하고 해결할 수 있어, 전반적인 애플리케이션 보안을 크게 향상시킬 수 있습니다. 
이는 비용 절감과 보안 강화로 이어져 조직에 큰 이점을 제공합니다. 🔒💻🚀
