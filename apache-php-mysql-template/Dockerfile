FROM php:8.2-apache

# 필수 패키지, PHP 확장 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git unzip libzip-dev default-mysql-client curl && \
    docker-php-ext-install pdo_mysql mysqli && \
    rm -rf /var/lib/apt/lists/*

# Apache 모듈 (rewrite, headers) 활성화
RUN a2enmod rewrite headers

# 작업 디렉터리 및 파일 복사 (퍼미션을 www-data로)
WORKDIR /var/www/html
COPY --chown=www-data:www-data ./public /var/www/html
COPY docker/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY docker/healthcheck.sh /usr/local/bin/healthcheck.sh
RUN chmod +x /usr/local/bin/healthcheck.sh

# 최종 포트 및 헬스체크
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD ["bash","/usr/local/bin/healthcheck.sh"]
