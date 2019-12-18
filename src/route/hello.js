exports.on_get = function (req, resp) {
    let name = req.params.name;

    return resp
        .status(200)
        .send(`Hello ${name}`)
        ;
};