# ---- Base Image with PHP and system packages ----
    FROM php:8.3-fpm

    WORKDIR /app
    
    # Install dependencies
    RUN apt-get update && apt-get install -y \
        git curl zip unzip libzip-dev libpng-dev libonig-dev \
        libxml2-dev libpq-dev libcurl4-openssl-dev gnupg ca-certificates sudo \
        && docker-php-ext-install pdo pdo_mysql zip mbstring curl
    
    # Install Composer
    COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
    
    # Install Node.js 20
    RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
        apt-get install -y nodejs && \
        npm install -g npm
    
    # Scaffold Laravel to a temp directory so we can use it later
    RUN composer create-project laravel/laravel /tmp/laravel "11.*"
    
    # Entrypoint setup
    COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
    RUN chmod +x /usr/local/bin/docker-entrypoint.sh
    
    EXPOSE 8000
    ENTRYPOINT ["docker-entrypoint.sh"]
    