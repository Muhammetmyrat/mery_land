const express = require('express')
const router = express.Router()
const apiCTRL = require('./../controllers/apiCTRL')
const contactCTRL = require('./../controllers/contactCTRL')


//----------------------------API ROUTER------------------------
router.get('/',apiCTRL.query)
router.get('/:lang/home',apiCTRL.get_home)
router.get('/:lang/get-header',apiCTRL.get_header)
router.get('/:lang/get-footer',apiCTRL.get_footer)
router.get('/:lang/contact-us/', apiCTRL.get_contact_us)
router.get('/:lang/about',apiCTRL.about)
router.post('/:lang/search',apiCTRL.search)
router.get('/:lang/products-all', apiCTRL.get_products)
router.get('/:lang/cat-products/:cat_id', apiCTRL.get_category_products)
router.get('/:lang/get_search_product/:product_id',apiCTRL.get_search_product)

//---------------------------SERVICE ROUTER----------------------

router.get('/:lang/service/:id',apiCTRL.service)



//---------------------------CONTACT ROUTER----------------------
router.post('/contact/email',contactCTRL.send_email)



module.exports=router