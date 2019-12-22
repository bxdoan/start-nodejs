const { pool } = require('./../config')

exports.getBooks = function (req, resp) {
    pool.query('SELECT * FROM books', (error, results) => {
        if (error) {
            throw error
        }
        resp.status(200).json(results.rows)
    })
};

exports.addBook = function (req, resp) {
    console.log(req)
    const { author, title } = req.body
    pool.query('INSERT INTO books (author, title) VALUES ($1, $2)', [author, title], error => {
        if (error) {
            throw error
        }
        resp.status(201).json({ status: 'success', message: 'Book added.' })
    })
}