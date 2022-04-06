const database = require('./../db/indexDB')

const query = async (req,res) => {
    const w = await database.query(`select * from reports;`,[])
    console.log(w.rows)
}
const get_header = async(req,res) =>{
    try{    
        const lang= req.params['lang']
        const q_lang = `select * from menu where lang_name='${lang}';`    
        const q_languages = `select short_name,image_path from languages;`
        const q_settings = `select * from settings;`
        const q_categories = `select category_id,name from product_categorie_translates where lang_name='${lang}';`
        const q_services = `select service_id,title from service_translates where lang_name='${lang}';`
        const services = await database.query(q_services)
        const languages = await database.query(q_languages)
        const settings = await database.query(q_settings,[]) 
        const categories = await database.query(q_categories,[])
        const  menu  = await database.query(q_lang, [])
        res.status(200).json({lang, services:services.rows,header:menu.rows[0], languages:languages.rows, settings:settings.rows[0], categories:categories.rows })

    }
    catch(e){
        res.status(500).send(e.message)
    }
}
const get_footer = async(req,res) =>{
    try{        
        const lang= req.params['lang']
        const q_footer = `select * from footer_titles where lang_name='${lang}'`
        const q_adress = `select address from address where lang_name='${lang}';`
        const q_phones = `select * from phones;`
        const footer = await database.query(q_footer,[])
        const adress = await database.query(q_adress,[]) 
        const phones = await database.query(q_phones,[]) 
        res.status(200).json({lang, footer:footer.rows[0],  address:adress.rows[0], phones:phones.rows})
    }
    catch(e){
        res.status(500).send(e.message)
    }
}
const get_home = async (req,res)=>{
    try{
        const lang= req.params['lang']
        
        const q_sliders = `select home_slider_translates.*,home_sliders.image_path from home_slider_translates 
                           Left Join home_sliders on home_sliders.id = home_slider_translates.slider_id where lang_name='${lang}';`
        const q_body = `select * from home_body where lang_name='${lang}';`
        const q_partners = `select * from images where role='partner';`
        const q_home_products = `SELECT products.image_path, product_translates.*  FROM product_translates 
                                 Left Join products on product_translates.product_id = products.id where lang_name='${lang}' ORDER BY id DESC LIMIT 3;`
        const q_home_body = `select id,title from service_translates where lang_name='${lang}';`
        const q_home_body_image = `select image_path from images where role='home_about_image';`
        const q_categories = `select b.name,a.id,a.image_path from product_categories a left join 
                              product_categorie_translates b on a.id=b.category_id where b.lang_name='${lang}' ;`
        const q_statistics = `select statistica_translates.title, statistica.image_path, statistica.amount from statistica_translates 
                              left Join statistica on statistica_translates.statistica_id=statistica.id where statistica_translates.lang_name='${lang}';`
        

        const categories = await database.query(q_categories,[])
        const slider = await database.query(q_sliders, [])
        const body = await database.query(q_body,[])
        const partners = await database.query(q_partners, [])
        const home_products = await database.query(q_home_products,[])
        const home_body = await database.query(q_home_body,[])
        const home_body_image = await database.query(q_home_body_image,[])
        const statistics = await database.query(q_statistics,[])
     

        const body_response = [
            body.rows[0],
            home_body_image.rows[0]
        ]
        const response = 
            home_body.rows
        
            res.status(200).json({lang, slider: slider.rows, body_texts:body_response, partners:partners.rows, home_products:home_products.rows, 
                response, categories:categories.rows, statistics:statistics.rows})
    }
    catch(e){
        console.log(e)
        res.status(500).send(e.message)
    }
}


const get_contact_us = async (req,res)=>{
    try{
        const lang= req.params['lang']
        
        const q_home_body_image = `select image_path from images where role='contact_header';`
        
        const q_notifications = `select * from reports where lang_name='${lang}';`
        const q_contact_body = `select contact_body.*,images.image_path from contact_body left Join images on images.role='contact_image' where contact_body.lang_name='${lang}';`
        
        const home_body_image = await database.query(q_home_body_image,[])
        
        const notifications = await database.query(q_notifications,[])
        const contact_body = await database.query(q_contact_body,[])
        res.status(200).json({lang, notifications:notifications.rows[0], contact_body:contact_body.rows[0], contact_body_image:home_body_image.rows[0]})
    }
    catch(e){
        res.status(500).send(e.message)
    }
}
    
const about = async (req,res)=>{
    try{
        
        const lang = req.params['lang']
        const q = `
            select * from about_body where lang_name ='${lang}';
        `
        const q_2 = `
                select image_path from images where  role = 'about_slider';
                `
        const q_3 = `
                select image_path from images where role = 'about_body'; 
        ` 
        const q_4 = `
                select image_path from images where role = 'about_header' ;
        `
        const  slider_images = []
        const { rows } = await database.query(q, [])
        const slider_image = await database.query(q_2, [])
        const about_body_image = await database.query(q_3, [])
        const about_head_image = await database.query(q_4, [])
        for(i=0; i<slider_image.rows.length; i++){ slider_images[i] = slider_image.rows[i].image_path }
        res.status(200).json({lang, data:rows[0], slider_images: slider_images, 
            about_body_image: about_body_image.rows[0], about_head_image: about_head_image.rows[0] })
    }
    catch(e){
        console.log(e)
        res.status(500).send(e.message)
    }
}

const service = async (req,res)=>{
    try{
        const lang= req.params['lang']
        const id = req.params['id']
        const q = `
            select service_translates.*,services.image_path from service_translates inner join services 
            on ${id} = services.id where service_id = ${id} and lang_name = '${lang}';
        `
        const { rows } = await database.query(q, [])
        res.status(200).json({lang, data:rows[0] })
    }
    catch(e){
        res.status(500).send(e.message)
    }
}

const search = async (req, res) => {
    try{
    const data = req.body.data
    const lang= req.params['lang']
    if (data)
    {
        var q = `SELECT product_translates.title, SUBSTRING(product_translates.text from 4 for 200) as text, 
                 products.image_path, products.id  FROM product_translates LEFT JOIN products on 
                 product_translates.product_id = products.id WHERE product_translates.lang_name = '${lang}'
                 and product_translates.title ILIKE '%${data}%' order by products.id ASC;`
    var query = await database.query(q,[])
    query = query.rows
    if(!query[0]) {res.status(200).send({msg:false})}
    else {res.status(200).send({msg:true, data:query})}
    }
    else res.status(200).send({msg:false})
    }
    catch(e){
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_products = async (req,res) => {
    const lang = req.params['lang']
    try{
        const {rows} = await database.query(`Select product_translates.title, product_translates.text, products.image_path from 
                                             product_translates left join products on product_id=products.id where lang_name='${lang}';`,[])
        const q_products_image = `select image_path from images where role='products_header';`
        const products_image = await database.query(q_products_image,[])
        
        res.status(200).send({data:rows,products_image:products_image.rows[0]})
    }  
    catch(e) {
        res.status(500).send(e.message)
    }
}

const get_category_products = async (req,res) => {
    const lang = req.params['lang']
    const cat_id = req.params['cat_id']
    try{
        
        const q_category_image = `select image_path from product_categories where id='${cat_id}';`
        const q_products = `select products.*, product_translates.* from product_translates left join products on product_translates.product_id=products.id where(products.category_id='${cat_id}') and (product_translates.lang_name='${lang}');`
        const category_image = await database.query(q_category_image,[])
        const products = await database.query(q_products,[])
        res.status(200).send({data:products.rows, category_image:category_image.rows[0]})
    }   
    catch(e){
        console.log(e)
        res.status(500).send(e.message)
    }
}

const get_search_product = async (req,res) => {

    const lang = req.params['lang']
    const product_id = req.params['product_id']
    try{
        const q_product = `select a.image_path, b.* from products a left join product_translates b on a.id=b.product_id
        where(b.lang_name='${lang}')and(b.product_id='${product_id}');`
        const {rows} = await database.query(q_product,[])
        res.status(200).send({ data:rows[0]})
    }   
    catch(e){
        console.log(e)
        res.status(500).send(e.message)
    }
}



module.exports={
    get_home,
    about, 
    service,
    query,
    get_contact_us,
    get_header,
    get_footer,
    get_products,
    get_category_products,
    search,
    get_search_product
}

