const express = require('express');


let app = express();

// listen at port :PORT - default as 3000
let port = process.env.PORT || 3030;
app.listen(port);
app.get('/', function (req, res) {
    res.render('index', {});
});

// print ready
console.log(`api server started at port=${port}`);