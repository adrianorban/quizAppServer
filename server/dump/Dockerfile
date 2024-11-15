FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=passwordHere

COPY ./nodejs_login_users.sql /docker-entrypoint-initdb.d/
COPY ./nodejs_login_tests.sql /docker-entrypoint-initdb.d/
COPY ./nodejs_login_questions.sql /docker-entrypoint-initdb.d/
COPY ./procedures.sql /docker-entrypoint-initdb.d/



#docker container run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password2000 mysql:5.7
#docker build -t mysql .
#docker run --name mysql -p 3306:3306 mysql
