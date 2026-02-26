FROM php:8.2-apache

# Отключаем все MPM модули
RUN a2dismod mpm_event mpm_worker

# Включаем один MPM
RUN a2enmod mpm_prefork

# Устанавливаем расширения PHP для WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Копируем весь WordPress в рабочую директорию
COPY . /var/www/html/

# Даем права на файлы Apache
RUN chown -R www-data:www-data /var/www/html

# Порт для Railway
EXPOSE 80

# Команда запуска Apache
CMD ["apache2-foreground"]