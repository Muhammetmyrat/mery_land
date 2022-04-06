const adminRouter = require('./adminRouter')
const loginRouter = require('./loginRouter')
const login_check_token = require('./../middlewares/login_check_token')
const apiRouter = require('./apiRouter')




module.exports=(app)=>{
    app.use('/api',apiRouter)
    app.use('/api/admin',login_check_token,adminRouter)
    app.use('/api/login',loginRouter)
}

