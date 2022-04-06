const nodemailer = require('nodemailer')


async function send_pass_mail(email,pass) {

            let transporter = nodemailer.createTransport({
                host: process.env.MAIL_HOST, //"smtp.gmail.com"
                port: process.env.MAIL_PORT,
                secure: true, // true for 465, false for other ports
                // service: 'gmail.com',
                auth: {
                    user: process.env.MAIL_USERNAME,//'gadamgurbanaga@gmail.com',//process.env.MAIL_USERNAME, // generated ethereal user
                    pass: process.env.MAIL_PASSWORD//'salam>1maryland',//'9PVIPn%q'//process.env.MAIL_PASSWORD, // generated ethereal password
                }
            });

            let info = await transporter.sendMail({
                from: process.env.MAIL_FROM_ADDRESS, // sender address
                to: email, // list of receivers
                subject: process.env.MAIL_SUBJECT, // Subject line
                text: `Confirm password: ${pass}`, // plain text body
            }, (err)=> {
                if (err) {
                    console.log('tazeden ugradya')
                    return send_pass_mail(email,pass)
                } else {
                    console.log('successfull')
                    return true
                }
            });
           
}

module.exports = {
    send_pass_mail
}