#!/bin/bash
if curl -fsS --max-time 5 http://localhost:8000/ >/dev/null; then
  exit 0
else
  exit 1
fi
