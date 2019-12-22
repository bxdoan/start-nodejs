# start-nodejs
- intro api app via nodejs ref. https://www.codementor.io/olatundegaruba/nodejs-restful-apis-in-10-minutes-q0sgsfhbd
- jwt api ref. https://www.codementor.io/@olawalealadeusi896/building-a-simple-api-with-nodejs-expressjs-postgresql-db-and-jwt-3-mke10c5c5
## Install package
`express` to create the server `nodemon` to keep track of changes to files and automatically restart the server
```
yarn add express
yarn add nodemon
```

## Run
ctrl-c to stop
```
# install package
yarn install

# run api
./run.sh
```

# Check

```bash
http :3030/books

curl -X POST \
  http://localhost:3030/books \
  -H 'Content-Type: application/json' \
  -d '{
	"author": "doan",
	"title" : "bui"
}'

http :3030/hello
```