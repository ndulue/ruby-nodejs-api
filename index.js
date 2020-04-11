var API_KEY = 12345
var SECRET_KEY = "MMD_MyRubyStore_asdflkjgh";

var express = require("express")
var router = express.Router()
var moment = require("moment")
var jwt = require('jsonwebtoken');
var expressJwt = require('express-jwt');

const jwtMW = expressJwt({
    secret: SECRET_KEY
})

router.get("/", function(res, req) {
        res.send("Hello")
    })
    /*
    router.get('/test', jwtMW, function(res, req, next) {
        var authorization = req.headers.authorization,
            decoded;

        try {
            decoded = jwt.verify(authorization.split(' ')[1], SECRET_KEY);
        } catch (e) {
            return res.status(401).send('unauthorized');
        }

        var email = decoded.email;
        res.send(JSON.stringify({ success: true, message: email }))
    })

    router.get('/key', function(res, req, next) {
        var email = req.body.email;

        if (email != null) {

            let token = jwt.sign({ email: email }, SECRET_KEY, {});
            res.send(JSON.stringify({ success: true, token: token }))

        } else {
            res.send(JSON.stringify({ success: false, message: 'Missing email' }))
        }
    })
    */


router.get("/user", function(res, req) {
    if (req.query.key == API) {

        var email = req.body.email
        var password = req.body.password

        if (email && password != null) {

            req.getConnection(function(error, conn) {
                conn.query("SELECT id, name, email FROM user WHERE email=?", [email], function(err, rows, fields) {
                    if (err) {
                        res.statusCode(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    } else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        } else {
                            res.send(JSON.stringify({ success: false, message: 'User does not exist' }))
                        }
                    }
                })
            })
        } else {
            res.send(JSON.stringify({ success: false, message: "Empty field(s)" }))
        }

    } else {
        res.send(JSON.stringify({ success: false, message: "Invalid api key" }))
    }
});




router.post("/user", function(req, res, next) {
    if (req.query.key == API_KEY) {

        var email = req.body.email
        var name = req.body.name
        var password = req.body.password

        if (email && name && password != null) {
            req.getConnection(function(error, conn) {
                conn.query("INSERT INTO users (name,email,password) VALUES(?,?,?)", [name, email, password], function(err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send({ success: false, message: err.message })
                    } else {
                        if (rows.affectedRows > 0) {
                            res.send({ success: false, message: "You registration is done" })
                        } else {
                            res.send({ success: true, message: "Error registering your data" })
                        }
                    }
                })
            })
        } else {
            res.send(JSON.stringify({ success: false, message: "Empty field(s)" }))
        }

    } else {
        res.send(JSON.stringify({ success: false, message: "Invalid api key" }))
    }
})



router.get('/product', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            conn.query("SELECT id, image, price, sku, title, description, label, view, manufacturer FROM products", function(err, rows, fields) {

                if (err) {
                    res.status(500)
                    res.send(JSON.stringify({ success: false, message: err.message }))
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }))
                    } else {
                        res.send(JSON.stringify({ success: false, message: "Empty" }))
                    }
                }

            })
        })
    } else {
        res.send(JSON.stringify({ success: false, message: "Invalid api key" }))
    }
})


router.post('/contact', function(res, req, next) {

    var first_name = req.body.first_name
    var last_name = req.body.last_name
    var email = req.body.email
    var subject = req.body.subject
    var message = req.body.message

    if (first_name && last_name && email && subject && message != null) {
        req.getConnection(function(error, conn) {
            conn.query("INSERT INTO contacts(first_name,last_name,email,subject,message) VALUES(?,?,?,?,?)", [first_name, last_name, email, subject, subject, message], function(error, rows, fields) {
                if (err) {
                    res.status(500)
                    res.send(JSON.stringify({ success: false, message: err.message }))
                } else {
                    if (rows.affectedRows > 0) {
                        res.send(JSON.stringify({ success: true, message: "Your message has been received" }))
                    } else {
                        res.send(JSON.stringify({ success: false, message: "Error inserting your details" }))
                    }
                }
            })
        })
    } else {
        res.send(JSON.stringify({ success: false, message: "Empty field(s)" }))
    }

})



router.get('/wishlist', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            var email = req.body.email
            conn.query("SELECT id, email, sku, FROM products WHERE email=?", [email], function(err, rows, fields) {

                if (err) {
                    res.status(500)
                    res.send(JSON.stringify({ success: false, message: err.message }))
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }))
                    } else {
                        res.send(JSON.stringify({ success: false, message: "Empty" }))
                    }
                }

            })
        })
    } else {
        res.send(JSON.stringify({ success: false, message: "Invalid api key" }))
    }
})



router.get('/checkWishlist', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            var email = req.body.email
            var sku = req.body.sku
            conn.query("SELECT id, email, sku, FROM products WHERE email=? & sku=?", [email, sku], function(err, rows, fields) {

                if (err) {
                    res.status(500)
                    res.send(JSON.stringify({ success: false, message: err.message }))
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }))
                    } else {
                        res.send(JSON.stringify({ success: false, message: "Empty" }))
                    }
                }

            })
        })
    } else {
        res.send(JSON.stringify({ success: false, message: "Invalid api key" }))
    }
})


router.post('/wishlist', function(res, req, next) {

    var id = req.body.id
    var email = req.body.email
    var sku = req.body.sku

    if (first_name && last_name && email && subject && message != null) {
        req.getConnection(function(error, conn) {
            conn.query("INSERT INTO wishlist(id,email,sku) VALUES(?,?,?)", [first_name, last_name, email, subject, subject, message], function(error, rows, fields) {
                if (err) {
                    res.status(500)
                    res.send(JSON.stringify({ success: false, message: err.message }))
                } else {
                    if (rows.affectedRows > 0) {
                        res.send(JSON.stringify({ success: true, message: "Your message has been received" }))
                    } else {
                        res.send(JSON.stringify({ success: false, message: "Error inserting your details" }))
                    }
                }
            })
        })
    } else {
        res.send(JSON.stringify({ success: false, message: "Empty field(s)" }))
    }

})


router.delete('/wishlist', function(res, req, next) {

    var id = req.body.id
    var email = req.body.email
    var sku = req.body.sku

    if (first_name && last_name && email && subject && message != null) {
        req.getConnection(function(error, conn) {
            conn.query("DELETE * FROM wishlist WHERE email=?", [email], function(error, rows, fields) {
                if (err) {
                    res.status(500)
                    res.send(JSON.stringify({ success: false, message: err.message }))
                } else {
                    if (rows.affectedRows > 0) {
                        res.send(JSON.stringify({ success: true, message: "This item has been deleted from your wishlist" }))
                    } else {
                        res.send(JSON.stringify({ success: false, message: "Error inserting your details" }))
                    }
                }
            })
        })
    } else {
        res.send(JSON.stringify({ success: false, message: "Empty field(s)" }))
    }
})