const express = require('express')
const router = express.Router()
const loginCTRL = require('./../controllers/loginCTRL')
const rescueCRTL = require('./../controllers/rescueCTRL')


router.post('/admin',loginCTRL.login_admin)
router.post('/rescue',rescueCRTL.send)
router.post('/rescue/new_pass',rescueCRTL.new_psw)


module.exports=router
