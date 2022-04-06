const nodemailer = require("nodemailer")
const database = require('./../db/indexDB')
const jwt = require('jsonwebtoken')
const bcrypt = require("bcrypt")
const { send_pass_mail } = require('./../functions/send_pass')



const send = async ( req, res) => {
    try{
        const email = req.body.email
        const q = `select username, role from admins where email = '${email}';`
        const { rows } = await database.query(q,[]);
        const username = rows[0].username
        const pass =  Math.floor((Math.random() * 99999) + 999999);

        const token = jwt.sign({ username: username, email: email, pass: pass },process.env.TOKEN_KEY , { expiresIn: 60*60*2 })
        
        await send_pass_mail(email, pass)

        res.status(200).json({token: token})
    }
    catch(err) {
        console.log('ERRROOOORRR: ' + err)
    }
}



const new_psw = async(req, res) => {
    try {
        const token = req.headers.authorization

        if (token){
        const { password, confirm_password, mail_pass } = req.body
            if (password === confirm_password && mail_pass) {
                const hash = await bcrypt.hash(password, 10);
                const decoded = await jwt.verify(token, process.env.TOKEN_KEY);
                            
                const username = decoded.username
                const email = decoded.email
                const pass = decoded.pass
                console.log(typeof(mail_pass), typeof(pass) )
                if (pass == mail_pass){
                    const q = `update admins set password = '${hash}' where email = '${email}' and username = '${username}' returning *`
                    await database.query(q,[])

                    res.status(200).json({ msg: 'update successfull'})
                } else {
                    res.status(500).json({ msg: 'The password you received from gmail is incorrect' })
                }
            } else {
                res.status(500).json({ msg: 'password confirm' })
            }

        } else { 
            res.status(500).json({ msg : 'no token' })
        }
    } catch (err) {
        res.status(500).json({ msg: err })
    }
}


module.exports={
    send,
    new_psw
}