# onlygamers

Create DB using Docker:

```bash
docker container run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=passwordHere mysql:5.7
```
Replace `MYSQL_ROOT_PASSWORD` with your password from `secrets/mysql-password`

Import the `sql` file from `dump` folder.

# Start de App

`npm run start`