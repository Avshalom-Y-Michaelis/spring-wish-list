# spring-wish-list





# docker comend in order to dockeris your project:

docker network create -d bridge swl-network

docker build -t spring-wish-list .
docker run --name swl-backend -d -p 8080:80 --network swl-network spring-wish-list

docker pull postgres
docker run --name swl-postgres -e POSTGRES_PASSWORD=postgres --network swl-network -p 5432:5432  -d postgres
docker exec -u postgres swl-postgres psql postgres postgres -f ./data.sql
