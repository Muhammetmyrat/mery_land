const nodemailer = require("nodemailer")
const database = require('./../db/indexDB')
const validator = require('validator');


const send_email= async ( req, res) => {
    try{
      const email = validator.isEmail(req.body.email)

      if(email){
        let outputhtml=`
        Mail details
        
        Name:${req.body.name}
        Email:${req.body.email}
        Subject:${req.body.subject}
        
            MESSAGE
        ${req.body.message} `
        const q = `
                  INSERT INTO send_messages(name, email, title, message) 
                  values('${req.body.name}','${req.body.email}','${req.body.subject}','${req.body.message}');
                `
       
        async function main() {
          // Generate test SMTP service account from ethereal.email
          // Only needed if you don't have a real mail account for testing
          // let testAccount = await nodemailer.createTestAccount();
        
          // create reusable transporter object using the default SMTP transport
          let transporter = nodemailer.createTransport({
            host: process.env.MAIL_HOST,//"smtp.gmail.com",
            port: 465,
            secure: true, // true for 465, false for other ports
            // service: 'gmail.com',
            auth: {
              user: process.env.MAIL_USERNAME, // generated ethereal user
              pass: process.env.MAIL_PASSWORD, // generated ethereal password
            },
          });
          console.log("MAILL")

          var mailOptions = {
            from: process.env.MAIL_FROM_ADDRESS,//'akmyradowakmuhammet21@gmail.com', // sender address
            to: process.env.MAIL_FROM_ADDRESS, // list of receivers
            // to: "akmyradowakmuhammet21@gmail.com", // list of receivers
            subject: process.env.MAIL_SUBJECT, // Subject line
            text: outputhtml, // plain text body
            // html: outputhtml, // html body
          }


          // send mail with defined transport object
          let info = await transporter.sendMail(mailOptions, async function(error, info){
            if (error) {
              console.log('restart');
               main()
            } else {
              console.log('Email sent: ' + info.messageId);
              console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
              const { rows } = await database.query(q,[]);
              res.send({status:true})
            }
          })
        
        }
        
        main()
        
        
      }
      else  {
        console.log('email not correct')
        res.send({
          status: false,
          msg: 'email not correct'
        })
      }
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




module.exports={
    send_email
}