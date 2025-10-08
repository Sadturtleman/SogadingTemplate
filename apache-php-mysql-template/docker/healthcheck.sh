#!/bin/bash
# 간단한 헬스체크: 메인 페이지 200 확인
if curl -fsS --max-time 5 http://localhost/ >/dev/null; then
  exit 0
else
  exit 1
fi
