# Берём официальный PHP + Apache
FROM php:8.2-apache

# Отключаем лишние MPM, оставляем один
RUN a2dismod mpm_event mpm_worker
RUN a2enmod mpm_prefork

# Устанавливаем расширения PHP для WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Копируем все файлы WordPress в рабочую директорию Apache
COPY . /var/www/html/

# Даем права на файлы Apache
RUN chown -R www-data:www-data /var/www/html

# Порт для Railway
EXPOSE 80

# Запуск Apache
CMD ["apache2-foreground"]