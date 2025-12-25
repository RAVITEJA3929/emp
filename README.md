docker network create ems-net

docker run -d --name devopsdb --network ems-net \
  -e MYSQL_ROOT_PASSWORD=password123 \
  -e MYSQL_DATABASE=employee_db \
  devopsdb:latest

sleep 40

docker run -d --name app-cont --network ems-net -p 1111:8080 employee-app:latest
