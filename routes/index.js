var API_KEY = 1234
var express = require('express')
var router = express.Router();
const saltRounds = 8;
var moment = require('moment');
var bcrypt = require('bcrypt');
//var jwt = require('jsonwebtoken');
//var expressJwt = require('express-jwt');
/*
const jwtMW = expressJwt({
    secret: SECRET_KEY
})
*/

router.get('/', function(req, res, next) {
    res.send('Hello');
});

//////////////////////////////////////////////////////////////////
//USER TABLE
//GET USER
//////////////////////////////////////////////////////////////////

router.get('/user', function(req, res, next) {
    if (req.query.key == API_KEY) {

        var email = req.query.email;
        var password = req.query.password;
        //var hashed = bcrypt.hash(req.query.password, saltRounds);

        if (email != null) {
            req.getConnection(function(error, conn) {
                conn.query('SELECT id, name, email, password FROM users WHERE email=? ', [email], function(err, rows, fields) {
                    if (err) {
                        res.status(500);
                        res.send(JSON.stringify({ success: false, message: err.message }));
                    } else {
                        if (rows.length > 0) {
                            let passwordIsValid = bcrypt.compareSync(password, rows[0].password);
                            if (!passwordIsValid) {
                                res.send(JSON.stringify({ success: false, message: 'wrong password'}));
                            }else{
                                res.send(JSON.stringify({ success: true, result: rows }));
                            }                            
                        } else {
                            res.send(JSON.stringify({ success: false, message: 'User does not exist' }));
                        }
                    }
                });
            });
        } else {
            res.send(JSON.stringify({ success: false, message: 'Empty email' }));
        }

    } else {
        res.send(JSON.stringify({ success: false, message: 'Invalid api key' }));
    }
});

//////////////////////////////////////////////////////////////////
//USER TABLE
//POST USER
//////////////////////////////////////////////////////////////////

router.post('/user', function(req, res, next) {
    if (req.body.key == API_KEY) {

        var email = req.body.email;
        var name = req.body.name;
        var password = req.body.password;

        if (email && name && password != null) {
            req.getConnection(function(error, conn) {
                bcrypt.hash(password, saltRounds, function(err, hash){
                    conn.query('INSERT INTO users (name,email,password) VALUES(?,?,?)', [name, email, hash], function(err, rows, fields) {
                        if (err) {
                            res.status(500);
                            res.send({ success: false, message: err.message });
                        } else {
                            if (rows.affectedRows > 0) {
                                res.send({ success: true, message: 'Your registration is done' });
                            } else {
                                res.send({ success: false, message: 'Error registering your data' });
                            }
                        }
                    });
                });
            });
        } else {
            res.send(JSON.stringify({ success: false, message: 'Empty field(s)' }));
        }

    } else {
        res.send(JSON.stringify({ success: false, message: 'Invalid api key' }));
    }
});

//////////////////////////////////////////////////////////////////
//PRODUCT TABLE
//GET PRODUCT
//////////////////////////////////////////////////////////////////

router.get('/product', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            conn.query('SELECT id, image, price, sku, title, description, label, view, manufacturer FROM products', function(err, rows, fields) {

                if (err) {
                    res.status(500);
                    res.send(JSON.stringify({ success: false, message: err.message }));
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }));
                    } else {
                        res.send(JSON.stringify({ success: false, message: 'Empty' }));
                    }
                }
            });
        });
    } else {
        res.send(JSON.stringify({ success: false, message: 'Invalid api key' }));
    }
});


//////////////////////////////////////////////////////////////////
//PRODUCT TABLE
//GET PRODUCT BY SKU
//////////////////////////////////////////////////////////////////

router.get('/product', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            conn.query('SELECT id, image, price, sku, title, description, label, view, manufacturer FROM products WHERE sku=?',[sku], function(err, rows, fields) {

                if (err) {
                    res.status(500);
                    res.send(JSON.stringify({ success: false, message: err.message }));
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }));
                    } else {
                        res.send(JSON.stringify({ success: false, message: 'Empty' }));
                    }
                }
            });
        });
    } else {
        res.send(JSON.stringify({ success: false, message: 'Invalid api key' }));
    }
});

//////////////////////////////////////////////////////////////////
//PRODUCT TABLE
//GET PRODUCT
//////////////////////////////////////////////////////////////////

router.post('/contact', function(res, req, next) {
    if (req.body.key == API_KEY) {

        var first_name = req.body.first_name;
        var last_name = req.body.last_name;
        var email = req.body.email;
        var subject = req.body.subject;
        var message = req.body.message;

        if (first_name && last_name && email && subject && message != null) {
            req.getConnection(function(error, conn) {
                conn.query('INSERT INTO contacts(first_name,last_name,email,subject,message) VALUES(?,?,?,?,?)', [first_name, last_name, email, subject, subject, message], function(error, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }));
                    } else {
                        if (rows.affectedRows > 0) {
                            res.send(JSON.stringify({ success: true, message: 'Your message has been received' }));
                        } else {
                            res.send(JSON.stringify({ success: false, message: 'Error inserting your details' }));
                        }
                    }
                });
            });
        } else {
            res.send(JSON.stringify({ success: false, message: 'Empty field(s)' }));
        }
    }
});

//////////////////////////////////////////////////////////////////
//WISHLIST TABLE
//POST USER
//////////////////////////////////////////////////////////////////

router.get('/wishlist', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            var email = req.query.email;
            conn.query('SELECT email, sku, image, name FROM wishlist WHERE email=?', [email], function(err, rows, fields) {

                if (err) {
                    res.status(500);
                    res.send(JSON.stringify({ success: false, message: err.message }));
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }));
                    } else {
                        res.send(JSON.stringify({ success: false, message: 'Empty' }));
                    }
                }
            });
        });
    } else {
        res.send(JSON.stringify({ success: false, message: 'Invalid api key' }));
    }
});

//////////////////////////////////////////////////////////////////
//WISHLIST TABLE
//GET WISHLIST
//////////////////////////////////////////////////////////////////

router.get('/checkWishlist', function(res, req, next) {
    if (req.query.key == API_KEY) {
        req.getConnection(function(error, conn) {
            var email = req.query.email;
            var sku = req.query.sku;
            conn.query('SELECT sku FROM wishlist WHERE email=? & sku=?', [email, sku], function(err, rows, fields) {

                if (err) {
                    res.status(500);
                    res.send(JSON.stringify({ success: false, message: err.message }));
                } else {
                    if (rows.length > 0) {
                        res.send(JSON.stringify({ success: true, result: rows }));
                    } else {
                        res.send(JSON.stringify({ success: false, message: 'Empty' }));
                    }
                }
            });
        });
    } else {
        res.send(JSON.stringify({ success: false, message: 'Invalid api key' }));
    }
});

//////////////////////////////////////////////////////////////////
//WISHLIST TABLE
//POST WISHLIST
//////////////////////////////////////////////////////////////////

router.post('/wishlist', function(res, req, next) {

    var email = req.body.email;
    var sku = req.body.sku;
    var image = req.body.image;
    var name = req.body.name;

    if (email && sku != null) {
        req.getConnection(function(error, conn) {
            conn.query('INSERT INTO wishlist(email,sku,image,name) VALUES(?,?)', [email, sku, image, name], function(error, rows, fields) {
                if (err) {
                    res.status(500);
                    res.send(JSON.stringify({ success: false, message: err.message }));
                } else {
                    if (rows.affectedRows > 0) {
                        res.send(JSON.stringify({ success: true, message: 'Your message has been received' }));
                    } else {
                        res.send(JSON.stringify({ success: false, message: 'Error inserting your details' }));
                    }
                }
            });
        });
    } else {
        res.send(JSON.stringify({ success: false, message: 'Empty field(s)' }));
    }
});

//////////////////////////////////////////////////////////////////
//WISHLIST TABLE
//DELETE USER
//////////////////////////////////////////////////////////////////

router.delete('/wishlist', function(res, req, next) {

    var id = req.body.id;
    var email = req.body.email;
    var sku = req.body.sku;

    if (email && sku != null) {
        req.getConnection(function(error, conn) {
            conn.query('DELETE * FROM wishlist WHERE email=? & sku=?', [email, sku], function(error, rows, fields) {
                if (err) {
                    res.status(500);
                    res.send(JSON.stringify({ success: false, message: err.message }));
                } else {
                    if (rows.affectedRows > 0) {
                        res.send(JSON.stringify({ success: true, message: 'This item has been deleted from your wishlist' }));
                    } else {
                        res.send(JSON.stringify({ success: false, message: ' Error inserting your details' }));
                    }
                }
            });
        });
    } else {
        res.send(JSON.stringify({ success: false, message: 'Empty field(s)' }));
    }
});

module.exports = router