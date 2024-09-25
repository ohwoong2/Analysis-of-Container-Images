# 1. 파이썬 알파인 이미지 사용 (경량화)
FROM python:3.9-alpine

# 2. 빌드 종속성 설치 (필요한 패키지만 설치)
# - py-curl: pytrends에 필요할 수 있는 네트워크 라이브러리
# - g++와 같은 컴파일러는 나중에 삭제하여 이미지 크기 감소
RUN apk add --no-cache --virtual .build-deps \
    gcc musl-dev libffi-dev openssl-dev \
    && apk add --no-cache libcurl curl

# 3. 작업 디렉토리 설정
WORKDIR /usr/src/app

# 4. 로컬 파일 복사
COPY requirements.txt ./
COPY trending_script.py ./

# 5. 파이썬 패키지 설치 (최신 버전 설치 방지로 보안 강화)
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

# 6. 빌드 종속성 제거 (이미지 경량화)
RUN apk del .build-deps

# 7. 실행 시 사용자 권한으로 실행 (루트 권한 방지)
RUN adduser -D myuser
USER myuser

# 8. 보안 강화: 기본 쉘을 sh로 설정
SHELL ["/bin/sh", "-c"]

# 9. 컨테이너 실행 명령어
CMD ["python", "./trending_script.py"]
