const jwt = require("jsonwebtoken");

const login_check_token = async (req, res, next) => {
    try {
        const token = req.headers['authorization']         
        if (token != undefined) {
            jwt.verify(token, process.env.TOKEN_KEY, (error) => {
                if (!error) {
                    console.log('Token dogry')
                    next()
                } else {
                    console.log('wagty doldy')
                    res.status(401).json({ status: 401 })
                }
            })
        } else {
            console.log('Token yok')
            res.status(401).json({ status: 401 })
        }
    } catch (e) {
        console.error(e)
        res.status(500).send(e.message)
    }
};


module.exports=login_check_token