# Python 3.12 슬림 이미지를 기본 이미지로 사용
FROM python:3.12-slim

# 작업 디렉터리 설정
WORKDIR /app

# 종속성 명시된 파일 복사
COPY pyproject.toml poetry.lock* /app/

# Poetry 설치 (의존성 관리)
RUN pip install poetry

# 의존성 설치 (개발 의존성 제외)
RUN poetry config virtualenvs.create false && poetry install --no-dev

# 소스 코드 복사
COPY src /app/src

# 서버 실행 명령 (예시)
CMD ["python", "-m", "src.my_server.server"]