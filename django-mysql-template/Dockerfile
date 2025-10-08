# Python 3.11 slim 이미지를 사용
FROM python:3.11-slim

# 환경 변수 설정
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# 필수 유틸리티 설치 (mysqlclient 대신 가벼운 기본 도구만)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential curl netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# 의존성 복사 및 설치
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# 프로젝트 코드 복사
COPY . .

# entrypoint 스크립트 복사
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
