# 파이썬 3.9 이미지를 기반으로 사용
FROM python:3.9-slim

# 컨테이너 안에서 작업할 디렉토리 설정
WORKDIR /usr/src/app

# 로컬 파일을 컨테이너 내부로 복사
COPY requirements.txt ./
COPY trending_script.py ./

# 필요한 파이썬 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 컨테이너가 실행될 때 실행할 명령어
CMD ["python", "./trending_script.py"]
