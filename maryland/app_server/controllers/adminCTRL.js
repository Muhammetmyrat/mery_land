const database = require('./../db/indexDB')
const path = require('path')
const imageUpload = require('./../functions/imageUpload')
const fileUpload = require('express-fileupload')
const fs = require('fs')





//------------- SETINGS----------------------

const get_setings =async (req, res) => {
    try {
        const q_text=`select * from settings;`
        const {rows}= await database.query(q_text)
        console.log(rows[0])
        res.json({
            status:true,
            data:rows
        })

    }
    catch (e) {
        res.status(500).send(e.message)
    }
}

const get_setings_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from settings WHERE id=$1;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })
  
    } catch (e) {
        res.status(500).send(e.message)
    }
}



const save_setings = async (req, res) => {
    try {
        console.log(req.body)
        // console.log(req.files)
          const {id,email,whatsapp}=req.body
          const logo = req.files && req.files.logo ? req.files.logo: false
          const logo_black = req.files && req.files.logo_black ? req.files.logo_black: false
          const favicon = req.files && req.files.favicon ? req.files.favicon: false
        
          const q_text = `Update settings set email=$1 ,whatsapp=$2 where id=$3 
                          Returning logo,logo_black,favicon ;` 
          const {rows} = await database.query(q_text,[email,whatsapp,id])
           
        
         
          if(logo){
            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].logo))
              const q_text = `Update settings set logo=$1 where id=$2 ;`
              const logo_path = await imageUpload.oneImageUploadsvg(logo,'settings')
            
              await database.query(q_text,[logo_path,id])
          }

          if(logo_black){
            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].logo_black))
              const q_text = `Update settings set logo_black=$1 where id=$2 ;`
              const logo_black_path = await imageUpload.oneImageUploadsvg(logo_black,'settings')
              await database.query(q_text,[logo_black_path,id])
          }

          if(favicon){
            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].favicon))
              const q_text = `Update settings set favicon=$1 where id=$2 ;`
              const favicon_path = await imageUpload.oneImageUploadsvg(favicon,'settings')
              await database.query(q_text,[favicon_path,id])
          }
          res.status(200).json({
              msg:'data save sucsesfully'
          })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

//-----------PHONES------------------

const get_phones = async (req, res) => {
    try {
        const q_text=`Select * from phones;`
        const {rows}=await database.query(q_text,[])
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const add_phones = async (req, res) => {
    try {
        console.log(req.body)
        const {phone_number} = req.body
        const q_text = `Insert into phones(phone_number) values($1); `
        await database.query(q_text,[phone_number])
        res.json({
            status:true,
            msg: 'Data added sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_phones_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from phones WHERE id=$1;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const save_phones = async (req, res) => {
    try {
        console.log(req.body)
        const {id,phone_number} = req.body
        const q_text = `Update phones set phone_number=$1 where id=$2;`
        await database.query(q_text,[phone_number,id])
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const delete_phones = async (req, res) => {
    try {
        const {id}= req.body
        const q_text=`Delete from phones where id=$1;` 
        await database.query(q_text,[id])
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




//--------------HOME TEXTS---------------------

const get_hometexts = async (req, res) => {
    try {
        const q_text=`Select * from home_body;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const add_hometexts = async (req, res) => {
    try {
        const {lang_name,title1,text1,statistica_title,title2,text2} = req.body
        console.log(req.body)
        const q_text=`Insert into home_body(lang_name,title1,text1,statistica_title,title2,text2)
                      values($1,$2,$3,$4,$5,$6);`
        await database.query(q_text,[lang_name,title1,text1,statistica_title,title2,text2]) 
        res.json({
            status:true,
            msg: 'Data added sucsesfully'
        })         
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_hometexts_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from home_body WHERE id=$1;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}


const save_hometexts = async (req, res) => {
    try {
        const {lang_name,title1,text1,statistica_title,title2,text2,id} = req.body
        console.log(req.body)
        const q_text = `Update home_body set lang_name=$1 ,title1=$2 ,text1=$3 ,
                        title2=$4 ,text2=$5 ,statistica_title=$6 where id=$7 ; `
        await database.query(q_text,[lang_name,title1,text1,title2,text2,statistica_title,id])
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })               
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const delete_hometexts = async (req, res) => {
    try {
        const {id}= req.body
        console.log(req.body)
        const q_text=`Delete from home_body where id=$1 ;`
        await database.query(q_text,[id])
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




//----------------PARTNERS--------------------

const get_partners = async (req, res) => {
    try {
        const q_text=`Select * from images where role='partner';`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        res.status(500).send(e.message)
    }
}


const add_partners = async (req, res) => {
    try {
        console.log(req.files)
        const image = req.files.image
        const q_text = `Insert into images(image_path,role) values($1,'partner');`
        const image_path = await imageUpload.oneImageUpload(image,'partners')
         await database.query(q_text,[image_path])
         res.json({
            status:true,
            msg: 'Data added sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_partners_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from images WHERE id=$1 and role='partner';"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}

const save_partners = async (req, res) => {
    try {
        const {id} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text = `Update images set image_path=$1 , role='partner' where id=$2;`
        if(image){
          const {rows} =  await database.query(`select image_path  from images where role='partner' and id=$1;`,[id])
            console.log(rows[0].image_path)
            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))

            const image_path= await imageUpload.oneImageUpload(image,'partners')
            console.log(image_path)
             await database.query(q_text,[image_path,id])
            res.json({
                status:true,
                msg: 'Data save sucsesfully'
            })
        }
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const delete_partners = async (req, res) => {
    try {
        const {id}= req.body
        const q_text=`Delete from images where id=$1 and role='partner' returning image_path;`
        const {rows} = await database.query(q_text,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



//----------------------LANGUAGES-----------------------

const get_languages = async (req, res) => {
    try {
        const q_text=`Select * from languages;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const add_languages = async (req, res) => {
    try {
        const {name,short_name} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files.image
        const image_path = await imageUpload.oneImageUploadsvg(image,'languages')
        const q_text=`Insert into languages(name,short_name,image_path)
                      values($1,$2,$3);`
        await database.query(q_text,[name,short_name,image_path]) 
        res.json({
            status:true,
            msg: 'Data added sucsesfully'
        })         
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_languages_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from languages WHERE id=$1;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}


const save_languages = async (req, res) => {
    try {
        const {name,short_name,id} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text = `Update languages set name=$1 ,short_name=$2 where id=$3 returning image_path;`
        const {rows} = await database.query(q_text,[name,short_name,id])
        if(image){
            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
               
            const image_path = await imageUpload.oneImageUploadsvg(image,'languages')
            await database.query('Update languages set image_path=$1 where id=$2;',[image_path,id])

        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const delete_languages = async (req, res) => {
    try {
        const {id}= req.body
        const q_text=`Delete from languages where id=$1 returning image_path;`
        const {rows} = await database.query(q_text,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


//------------MENU-----------------
const get_menu = async (req, res) => {
    try {
        const q_text=`Select * from menu;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const get_menu_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from menu WHERE id=$1 ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const save_menu = async (req, res) => {
    try {
        console.log(req.body)
        const {lang_name,menu1,menu2,menu3,menu4,menu5,id} = req.body
        const q_text = `Update menu set lang_name=$1 ,menu1=$2 ,menu2=$3 ,
                        menu3=$4 ,menu4=$5 ,menu5=$6 where id=$7 ; `
        await database.query(q_text,[lang_name,menu1,menu2,menu3,menu4,menu5,id])
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




//------------ADDRESS-----------------
const get_address = async (req, res) => {
    try {
        const q_text=`Select * from address;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_address_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from address WHERE id=$1 ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const save_address = async (req, res) => {
    try {
        console.log(req.body)    
        const {lang_name,address,id} = req.body
        const q_text = `Update address set lang_name=$1 ,address=$2  where id=$3 ; `
        await database.query(q_text,[lang_name,address,id])
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


//------------FOOTER TITLES-----------------
const get_footer_titles = async (req, res) => {
    try {
        const q_text=`Select * from footer_titles;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        res.status(500).send(e.message)
    }
}

const get_footer_titles_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from footer_titles WHERE id=$1 ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}



const save_footer_titles = async (req, res) => {
    try {
        console.log(req.body)
        const {lang_name,title1,title2,title3,title4,title5,id} = req.body
        const q_text = `Update footer_titles set lang_name=$1 ,title1=$2 ,title2=$3 ,
                        title3=$4 ,title4=$5 ,title5=$6 where id=$7 ; `
        await database.query(q_text,[lang_name,title1,title2,title3,title4,title5,id])
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



//------------CONTACT BODY-----------------
const get_contact_body = async (req, res) => {
    try {
        const q_text=`Select * from contact_body;`
        const q_image= `select image_path from images where role='contact_header';`
        const {rows}=await database.query(q_text)
        const image = await database.query(q_image)
        res.json({
            status:true,
            data: rows,
            image: image.rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_contact_body_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from contact_body WHERE id=$1 ;"
        const q_image= `select image_path from images where role='contact_header';`
        const data = await database.query(q_text,[id])
        const image = await database.query(q_image)
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows,
            image: image.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const save_contact_body = async (req, res) => {
    try {
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const {lang_name,title1,text1,title2,contact_name,contact_email,contact_subject,contact_message,contact_button,id} = req.body
        const q_text = `Update contact_body set lang_name=$1 ,title1=$2 ,text1=$3 ,
                        title2=$4 ,contact_name=$5 ,contact_email=$6 ,contact_subject=$7, 
                        contact_message=$8, contact_button=$9 where id=$10 ; `
        await database.query(q_text,[lang_name,title1,text1,title2,contact_name,contact_email,contact_subject,contact_message,contact_button,id])
        if(image){
            const {rows} =await database.query(`select image_path from images where role='contact_header';`,[])
              imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
            const image_path = await imageUpload.oneImageUpload(image,'contact_image')

             await database.query(`Update images set image_path=$1 where role='contact_header';`,[image_path])

        }

        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




//------------ABOUT BODY-----------------
const get_about_body = async (req, res) => {
    try {
        const q_text=`Select * from about_body;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        res.status(500).send(e.message)
    }
}

const get_about_body_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from about_body WHERE id=$1 ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}


const save_about_body = async (req, res) => {
    try {
        const {lang_name,title1,text1,title2,text2,button_text,id} = req.body
        console.log(req.body)
        const q_text = `Update about_body set lang_name=$1 ,title1=$2 ,text1=$3 ,
                        title2=$4 ,text2=$5 ,button_text=$6 where id=$7 returning * ; `
        const {rows} = await database.query(q_text,[lang_name,title1,text1,title2,text2,button_text,id])
        console.log(rows)
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        }) 


    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



//----------------ABOUT SLIDER--------------------

const get_about_slider = async (req, res) => {
    try {
        const q_text=`Select * from images where role='about_slider';`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        res.status(500).send(e.message)
    }
}


const add_about_slider = async (req, res) => {
    try {
        // console.log(req.files)
        const image = req.files.image
        const q_text = `Insert into images(image_path,role) values($1,'about_slider');`
        const image_path = await imageUpload.oneImageUpload(image,'about_sliders')
         await database.query(q_text,[image_path])
         res.json({
            status:true,
            msg: 'Data added sucsesfully'
        })
    }
    catch (e) {
        res.status(500).send(e.message)
    }
}

const get_about_slider_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from images WHERE id=$1 and role='about_slider' ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}


const save_about_slider = async (req, res) => {
    try {
        const {id} = req.body
        const image = req.files && req.files.image ? req.files.image : false
        const q_text = `Update images set image_path=$1 , role='about_slider' where id=$2;`
        if(image){
          const {rows} =  await database.query(`select image_path  from images where role='about_slider' and id=$1;`,[id])

            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))

            const image_path= await imageUpload.oneImageUpload(image,'about_sliders')
             await database.query(q_text,[image_path,id])
            res.json({
                status:true,
                msg: 'Data save sucsesfully'
            })
        }
    }
    catch (e) {
        res.status(500).send(e.message)
    }
}

const delete_about_slider = async (req, res) => {
    try {
        const {id}= req.body
        const q_text=`Delete from images where id=$1 and role='about_slider' returning image_path;`
        const {rows} = await database.query(q_text,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        res.status(500).send(e.message)
    }
}



//----------------ABOUT MAIN IMAGES--------------------

const get_about_main_images = async (req, res) => {
    try {
        const q_text=`Select * from images where role in ('about_header','about_body');`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_about_main_images_id = async (req, res) => {
    try {
        const id=req.params.id
        const q_text=`Select * from images where role in ('about_header','about_body');`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}



const save_about_main_images = async (req, res) => {
    try {
        const {id1,id2} = req.body
        console.log(req.body)
        
        const image1 = req.files && req.files.image1 ? req.files.image1 : false
        console.log(image1)
        const image2 = req.files && req.files.image2 ? req.files.image2 : false
        console.log(image2)

        const q_text = `Update images set image_path=$1 , role=$2 where id=$3;`
        if(image1){
          const {rows} =  await database.query(`select image_path  from images where role='about_header' and id=$1;`,[id1])
             console.log(rows[0].image_path)
            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))

            const image_path= await imageUpload.oneImageUpload(image1,'about_main_images')
            console.log(image_path)

             await database.query(q_text,[image_path,'about_header',id1])

        }
        if(image2){
            const {rows} =  await database.query(`select image_path  from images where role='about_body' and id=$1;`,[id2])
            console.log(rows[0].image_path)
  
              imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
  
              const image_path= await imageUpload.oneImageUpload(image2,'about_main_images')
            console.log(image_path)

               await database.query(q_text,[image_path,'about_body',id2])
  
          }

        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}






//------------PRODUCT HEADER-----------------
const get_products_header = async (req, res) => {
    try {
        const q_text1=`Select * from products_header;`
        const q_text2=`Select * from images where role='products_header';`
        const data1=await database.query(q_text1)
        const image=await database.query(q_text2)
        res.json({
            status:true,
            data: data1.rows,
            image: image.rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_products_header_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text1 = "select * from images WHERE role='products_header' ;"
        const q_text = "select * from products_header WHERE id=$1 ;"
        const image = await database.query(q_text1,[])
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            image_path: image.rows[0],
            data: data.rows[0]
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const save_products_header = async (req, res) => {
    try {
        const {lang_name,title,id} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false

        const q_text = `Update products_header set lang_name=$1 ,title=$2 where id=$3 ; `
        await database.query(q_text,[lang_name,title,id])

        if(image){
          const {rows} =  await database.query(`select image_path  from images where role='products_header';`,[])

            imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
      
            const q_text = `Update images set image_path=$1 where role='products_header';`

            const image_path= await imageUpload.oneImageUpload(image,'products_header_images')
             await database.query(q_text,[image_path])
            
        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        }) 


    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




//------------REPORTS-----------------
const get_reports = async (req, res) => {
    try {
        const q_text=`Select * from reports;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const get_reports_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select * from reports WHERE id=$1 ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const save_reports = async (req, res) => {
    try {
        const {lang_name,report1,report2,report3,report4,id} = req.body
        const q_text = `Update reports set lang_name=$1 ,report1=$2 ,report2=$3 ,
                        report3=$4 ,report4=$5  where id=$6 ; `
        await database.query(q_text,[lang_name,report1,report2,report3,report4,id])
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}





//     SERVICES

const get_services = async (req, res) => {
    try {
        const q_text=`Select * from services;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const add_services = async (req, res) => {
    try {
        console.log(req.body)
        console.log(req.files.image)
        const {lang_name,title,text} = req.body
        const image = req.files && req.files.image ? req.files.image : false
        // console.log(image)
        const q_text = `Insert into services(title,text,image_path)
                        values($1,$2,$3) returning id;`

        if(image){
            const image_path = await imageUpload.oneImageUpload(image,'services_images')
            // console.log('image_path')
            // console.log(image_path)
            const {rows} = await database.query(q_text,[title[0],text[0],image_path])
             for(let i=0;i<lang_name.length;i++){
                 const q_text = `Insert into service_translates(lang_name,service_id,title,text)
                                 values($1,$2,$3,$4);`
                const service_id = rows[0].id                
                await database.query(q_text,[lang_name[i],service_id,title[i],text[i]])               
             }
             res.json({
                status:true,
                msg: 'Data added sucsesfully'
            }) 
                                      
        }

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_services_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = "select a.image_path as image_path,b.* from services a inner join service_translates b on a.id=b.service_id   WHERE a.id=$1 ;"
        const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const save_services = async (req, res) => {
    try {
        console.log(req.body)
        console.log(req.files)
        const {id,lang_name,service_id,title,text} = req.body
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Update service_translates set lang_name=$1 ,
                         service_id=$2 ,title=$3 ,text=$4 where id=$5;`
        const q_text2 = `Update services set title=$1 ,text=$2 where id=$3 returning image_path;`
        const {rows} = await database.query(q_text2,[title[0],text[0],service_id])
        if(image){
        imageUpload.deleteFile(path.normalize(__dirname + './../../' +rows[0].image_path)) 

        const image_path = await imageUpload.oneImageUpload(image,'services_images')
        database.query('Update services set image_path=$1 where id=$2;',[image_path,service_id])
          
        }
          
        for(let i=0;i<lang_name.length;i++){
          await database.query(q_text1,[lang_name[i],service_id,title[i],text[i],id[i]])
        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const delete_services = async (req, res) => {
    try {
        const {id}= req.body
        const q_text1=`Delete from services where id=$1 returning image_path;`
        const {rows} = await database.query(q_text1,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




//-----------------------------------HOME SLIDERS--------------------------------------

const get_home_sliders = async (req, res) => {
    try {
        const q_text=`Select * from home_sliders;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })
    }
    catch (e) {

        res.status(500).send(e.message)
    }
}


const add_home_sliders = async (req, res) => {
    try {
        const {lang_name,title,text} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text = `Insert into home_sliders(title,text,image_path)
                        values($1,$2,$3) returning id;`


        if(image){
            const image_path = await imageUpload.oneImageUpload(image,'home_slider_images')
            const {rows} = await database.query(q_text,[title[0],text[0],image_path])
            const slider_id = rows[0].id  
            
             for(let i=0;i<lang_name.length;i++){
                 const q_text1 = `Insert into home_slider_translates(lang_name,slider_id,title,text)
                                 values($1,$2,$3,$4);`
        
                const{rows} = await database.query(q_text1,[lang_name[i],slider_id,title[i],text[i]]) 

            }
             res.json({
                status:true,
                msg: 'Data added sucsesfully'
            }) 
                                      
        }

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_home_sliders_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = `
        select a.id as slider_id, a.image_path, b.* from home_sliders a
            inner join home_slider_translates b on a.id=b.slider_id
        where a.id=$1
    `



    const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}



const save_home_sliders = async (req, res) => {
    try {
        const {id,lang_name,slider_id,title,text} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Update home_slider_translates set lang_name=$1 ,
                         slider_id=$2 ,title=$3 ,text=$4 where id=$5;`

        const q_text2 = `Update home_sliders set title=$1 ,text=$2 where id=$3 returning image_path;`

        const {rows} = await database.query(q_text2,[title[0],text[0],slider_id])
        if(image){
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path)) 

        const image_path = await imageUpload.oneImageUpload(image,'home_slider_images')

        database.query('Update home_sliders set image_path=$1 where id=$2;',[image_path,slider_id])
      
        }
          
        for(let i=0;i<lang_name.length;i++){
          await database.query(q_text1,[lang_name[i],slider_id,title[i],text[i],id[i]])
        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const delete_home_sliders = async (req, res) => {
    try {
        const {id}= req.body
        console.log(id)
        const q_text1=`Delete from home_sliders where id=$1 returning image_path;`
        const {rows} = await database.query(q_text1,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}







//     PRUDUCTS CATEGORY

const get_product_categories = async (req, res) => {
    try {
        const q_text=`Select * from product_categories;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })
    }

    catch (e) {
        res.status(500).send(e.message)
    }
}


const add_product_categories = async (req, res) => {
    try {
        const {lang_name,name} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Insert into product_categories(name,image_path)
                         values($1,$2) returning id ;`
        
        const q_text2 = `Insert into product_categorie_translates(lang_name,category_id,name) 
                         values($1,$2,$3) ;`
        if(image){
            const image_path = await imageUpload.oneImageUpload(image,'product_categories_images')
            const {rows} = await database.query(q_text1,[name[0],image_path])
            const category_id = rows[0].id 

            for(let i=0;i<lang_name.length;i++){
                await database.query(q_text2,[lang_name[i],category_id,name[i]])
            }
            res.json({
                status:true,
                msg: 'Data added sucsesfully'
            }) 
        }
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_product_categories_id = async (req, res) => {
    try {
        const id=req.params.id
        console.log(req.params.id)
        const q_text = "select a.image_path as image_path,a.id as category_id, b.*  from  product_categories a inner join product_categorie_translates b on a.id=b.category_id  WHERE a.id=$1 ;"
        const {rows} = await database.query(q_text,[id])
    
        res.json({
            status: true,
            data: rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}




const save_product_categories = async (req, res) => {
    try {
        const {id,lang_name,category_id,name} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Update product_categorie_translates set lang_name=$1 ,
                         category_id=$2 ,name=$3  where id=$4;`

        const q_text2 = `Update product_categories set name=$1  where id=$2 returning image_path;`

        const {rows} = await database.query(q_text2,[name[0],category_id])
        if(image){
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path)) 

        const image_path = await imageUpload.oneImageUpload(image,'product_categories_images')

        database.query('Update product_categories set image_path=$1 where id=$2;',[image_path,category_id])
      
        }
          
        for(let i=0;i<lang_name.length;i++){
          const {rows} = await database.query(q_text1,[lang_name[i],category_id,name[i],id[i]])
          console.log(rows)
        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const delete_product_categories = async (req, res) => {
    try {
        const {id}= req.body
        const q_text=`Delete from product_categories where id=$1 returning image_path ;`
        const {rows} = await database.query(q_text,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        res.status(500).send(e.message)
    }
}








//     PRUDUCTS

const get_products = async (req, res) => {
    try {
        const q_text=`Select * from products;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const add_products = async (req, res) => {
    try {
        const {lang_name,title,text,category_id} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Insert into products(title,text,image_path,category_id)
                         values($1,$2,$3,$4) returning id;`
        const q_text2 = `Insert into product_translates(lang_name,product_id,title,text)
                         values($1,$2,$3,$4);`


        if(image){
            const image_path = await imageUpload.oneImageUpload(image,'product_images')
            const {rows} = await database.query(q_text1,[title[0],text[0],image_path,category_id])
            const product_id = rows[0].id  
             for(let i=0;i<lang_name.length;i++){
              
                await database.query(q_text2,[lang_name[i],product_id,title[i],text[i]])               
             }
             res.json({
                status:true,
                msg: 'Data added sucsesfully'
            }) 
                                      
        }

              
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_products_id = async (req, res) => {
    try {
        const id=req.params.id
        console.log(id)
        const q_text = `select a.image_path as image_path,a.id as product_id,a.category_id  as  category_id,c.name as category_name , b.* from products a 
                        inner join product_translates b on a.id=b.product_id 
                        inner join product_categories c on c.id=a.category_id WHERE a.id=$1;`
        const data = await database.query(q_text,[id])
        console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const save_products = async (req, res) => {
    try {
        console.log(req.body)
        console.log(req.files)

        const {id,lang_name,product_id,category_id,title,text} = req.body
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Update product_translates set lang_name=$1 ,
                         product_id=$2 ,title=$3 ,text=$4 where id=$5;`

        const q_text2 = `Update products set title=$1,text=$2 ,category_id=$3 where id=$4 returning image_path;`

        const {rows} = await database.query(q_text2,[title[0],text[0],category_id,product_id])
        if(image){
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path)) 

        const image_path = await imageUpload.oneImageUpload(image,'product_images')

        database.query('Update products set image_path=$1 where id=$2;',[image_path,product_id])
      
        }
          
        for(let i=0;i<lang_name.length;i++){
          await database.query(q_text1,[lang_name[i],product_id,title[i],text[i],id[i]])
        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const delete_products = async (req, res) => {
    try {
        const {id}= req.body
        const q_text=`Delete from products where id=$1 returning image_path ;`
        const {rows} = await database.query(q_text,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}






//-----------------------------------STATISTICA--------------------------------------

const get_statistica = async (req, res) => {
    try {
        const q_text=`Select * from statistica;`
        const {rows}=await database.query(q_text)
        res.json({
            status:true,
            data: rows
        })
    }
    catch (e) {
        res.status(500).send(e.message)
    }
}


const add_statistica = async (req, res) => {
    try {
        const {lang_name,title,amount} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text = `Insert into statistica(title,amount,image_path)
                        values($1,$2,$3) returning id;`


        if(image){
            const image_path = await imageUpload.oneImageUploadsvg(image,'statistica')
            const {rows} = await database.query(q_text,[title[0],amount,image_path])
            const statistica_id = rows[0].id  
            
             for(let i=0;i<lang_name.length;i++){
                 const q_text = `Insert into statistica_translates(lang_name,statistica_id,title)
                                 values($1,$2,$3);`
        
                const {rows} = await database.query(q_text,[lang_name[i],statistica_id,title[i]]) 

            }
             res.json({
                status:true,
                msg: 'Data added sucsesfully'
            }) 
                                      
        }

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_statistica_id = async (req, res) => {
    try {
        const id=req.params.id
        // console.log(id)
        const q_text = `
        select a.id as statistica_id, a.image_path,a.amount, b.* from statistica a
            inner join statistica_translates b on a.id=b.statistica_id
        where a.id=$1
    `



    const data = await database.query(q_text,[id])
        // console.log(data.rows)
        res.json({
            status: true,
            data: data.rows
        })

    } catch (e) {
        res.status(500).send(e.message)
    }
}



const save_statistica = async (req, res) => {
    try {
        const {id,lang_name,statistica_id,title,amount} = req.body
        console.log(req.body)
        console.log(req.files)
        const image = req.files && req.files.image ? req.files.image : false
        const q_text1 = `Update statistica_translates set lang_name=$1 ,
                         statistica_id=$2 ,title=$3  where id=$4;`

        const q_text2 = `Update statistica set title=$1 ,amount=$2 where id=$3 returning image_path;`

        const {rows} = await database.query(q_text2,[title[0],amount,statistica_id])
        if(image){
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path)) 

        const image_path = await imageUpload.oneImageUploadsvg(image,'statistica')

        database.query('Update statistica set image_path=$1 where id=$2;',[image_path,statistica_id])
      
        }
          
        for(let i=0;i<lang_name.length;i++){
          await database.query(q_text1,[lang_name[i],statistica_id,title[i],id[i]])
        }
        res.json({
            status:true,
            msg: 'Data save sucsesfully'
        })  

    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}



const delete_statistica = async (req, res) => {
    try {
        const {id}= req.body
        console.log(id)
        const q_text1=`Delete from statistica where id=$1 returning image_path;`
        const {rows} = await database.query(q_text1,[id])
        imageUpload.deleteFile(path.normalize(__dirname + './../../' + rows[0].image_path))
        res.json({
            status:true,
            msg: 'Data deleted sucsesfully'
        })
    }
    catch (e) {
        console.log(e)
        res.status(500).send(e.message)
    }
}









module.exports = {

    get_setings,
    get_setings_id,
    save_setings,

    get_phones,
    get_phones_id,
    add_phones,
    save_phones,
    delete_phones,

    get_hometexts,
    get_hometexts_id,
    add_hometexts,
    save_hometexts,
    delete_hometexts,


    get_partners,
    get_partners_id,
    add_partners,
    save_partners,
    delete_partners,

    get_languages,
    get_languages_id,
    add_languages,
    save_languages,
    delete_languages,

    get_menu,
    get_menu_id,
    save_menu,

    get_address,
    get_address_id,
    save_address,

    get_footer_titles,
    get_footer_titles_id,
    save_footer_titles,

    get_contact_body,
    get_contact_body_id,
    save_contact_body,


    get_about_body,
    get_about_body_id,
    save_about_body,

    get_about_slider,
    get_about_slider_id,
    add_about_slider,
    save_about_slider,
    delete_about_slider,

    get_about_main_images,
    get_about_main_images_id,
    save_about_main_images,


    get_products_header,
    get_products_header_id,
    save_products_header,


    get_reports,
    get_reports_id,
    save_reports,

    get_services,
    get_services_id,
    add_services,
    save_services,
    delete_services,


    get_home_sliders,
    get_home_sliders_id,
    add_home_sliders,
    save_home_sliders,
    delete_home_sliders,


    get_product_categories,
    get_product_categories_id,
    add_product_categories,
    save_product_categories,
    delete_product_categories,


    get_products,
    get_products_id,
    add_products,
    save_products,
    delete_products,



    get_statistica,
    get_statistica_id,
    add_statistica,
    save_statistica,
    delete_statistica,

}




