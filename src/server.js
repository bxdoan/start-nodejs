const express = require('express');

const hello  = require('./route/hello');

let app = express();

// listen at port :PORT - default as 3030
let port = process.env.PORT || 3030;
app.listen(port);


app.route('/hello'      ).get(hello.on_get);

// print ready
console.log(`api server started at port=${port}`);