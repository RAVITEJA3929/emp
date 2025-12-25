FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=password123
ENV MYSQL_DATABASE=employee_db
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
