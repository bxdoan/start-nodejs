exports.on_get = function (req, resp) {
    let name = req.params.name;
    console.log(`name is ` + name)
    if (name == 'undefined') {
         name = 'world'
    }
    return resp
        .status(200)
        .send(`Hello ${name}!!!`)
        ;
};