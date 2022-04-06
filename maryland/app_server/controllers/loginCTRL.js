const database = require("./../db/indexDB")
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')

const login_admin = async (req,res) => {
    try {
        const {username,password} = req.body
        console.log(req.body)
        if(!(username) || !(password)){
            res.json({
                status:false,
                msg: 'Please enter your name and password'
            })
        }

        
        if(username && password){

        const q_text = `select * from admins where username=$1;`
        const {rows} = await database.query(q_text,[username])
        const result = await bcrypt.compare(password,rows[0].password);
        if(rows[0] && rows[0].id && result){
            admin_token = await jwt.sign({ id: rows[0].id },process.env.TOKEN_KEY, { expiresIn: 60*60*24 })
            res.json({
                status:true,
                msg: 'You are login',
                token: admin_token
            })
                      
            
        }
        else{
            res.json({
                status: false,
                msg: 'username or password not correct'
            })
        }}

    } catch (e) {
        console.log(e);
        res.status(500).send(e.message);
    }
};

module.exports = {
    login_admin,
};
