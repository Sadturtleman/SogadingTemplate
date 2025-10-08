# Django + MySQL Template (For platform submissions)

## Quickstart (local)
1. Copy example env:
   ```bash
   cp .env.example .env
   ```
2. Start local stack:
   ```bash
   docker-compose up --build
   ```
3. Open http://localhost:8000 and you should see the sample page.

## CI / Platform
- This repo includes a GitHub Actions workflow at `.github/workflows/ci-deploy.yml`.
- You must set the following GitHub Secrets:
  - `REGISTRY` (e.g. ghcr.io or registry.example.com)
  - `REGISTRY_USERNAME`
  - `REGISTRY_PASSWORD`
  - `IMAGE_NAME` (e.g. myorg/myapp)
  - `PLATFORM_API` (platform registration endpoint)
  - `PLATFORM_TOKEN` (token for platform API)
- Platform is expected to accept the registration payload and create a k8s namespace + resources.

## Notes
- This template uses `pymysql` to avoid native build deps during pip install. The Dockerfile installs `default-libmysqlclient-dev` for compatibility if needed.
- entrypoint will run migrations automatically at container start. For production you may want to separate migrations from runtime.
