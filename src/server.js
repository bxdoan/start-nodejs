const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const hello  = require('./route/hello');
const books  = require('./route/books');
const port = process.env.PORT || 3030
const app = express()

const isProduction = process.env.NODE_ENV === 'production'
const origin = {
    origin: isProduction ? 'https://www.example.com' : '*',
}

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors(origin))


app.route('/books')
    // GET endpoint
    .get(books.getBooks)
    // POST endpoint
    .post(books.addBook)

app.route('/hello'      ).get(hello.on_get);
app.route('/hello/'     ).get(hello.on_get);
app.route('/hello/:name').get(hello.on_get);
// Start server
app.listen(port, () => {
    console.log(`Server listening in port: ` + port)
})