const express = require('express')
const router = express.Router()
const adminCTRL = require('./../controllers/adminCTRL')




// SETINGS
router.get('/get-setings',adminCTRL.get_setings)
router.get('/get-setings/:id',adminCTRL.get_setings_id)
router.post('/save-setings',adminCTRL.save_setings)



// PHONES
router.get('/get-phones',adminCTRL.get_phones)
router.get('/get-phones/:id',adminCTRL.get_phones_id)
router.post('/add-phones',adminCTRL.add_phones)
router.post('/save-phones',adminCTRL.save_phones)
router.post('/delete-phones',adminCTRL.delete_phones)


// HOME TEXTS
router.get('/get-hometexts',adminCTRL.get_hometexts)
router.get('/get-hometexts/:id',adminCTRL.get_hometexts_id)
router.post('/add-hometexts',adminCTRL.add_hometexts)
router.post('/save-hometexts',adminCTRL.save_hometexts)
router.post('/delete-hometexts',adminCTRL.delete_hometexts)

// PARTNERS
router.get('/get-partners',adminCTRL.get_partners)
router.get('/get-partners/:id',adminCTRL.get_partners_id)
router.post('/add-partners',adminCTRL.add_partners)
router.post('/save-partners',adminCTRL.save_partners)
router.post('/delete-partners',adminCTRL.delete_partners)



// LANGUAGES
router.get('/get-languages',adminCTRL.get_languages)
router.get('/get-languages/:id',adminCTRL.get_languages_id)
router.post('/add-languages',adminCTRL.add_languages)
router.post('/save-languages',adminCTRL.save_languages)
router.post('/delete-languages',adminCTRL.delete_languages)


// MENU
router.get('/get-menu',adminCTRL.get_menu)
router.get('/get-menu/:id',adminCTRL.get_menu_id)
router.post('/save-menu',adminCTRL.save_menu)


// ADDRESS
router.get('/get-address',adminCTRL.get_address)
router.get('/get-address/:id',adminCTRL.get_address_id)
router.post('/save-address',adminCTRL.save_address)


// FOOTER TITLES
router.get('/get-footer-titles',adminCTRL.get_footer_titles)
router.get('/get-footer-titles/:id',adminCTRL.get_footer_titles_id)
router.post('/save-footer-titles',adminCTRL.save_footer_titles)



// CONTACT BODY
router.get('/get-contact-body',adminCTRL.get_contact_body)
router.get('/get-contact-body/:id',adminCTRL.get_contact_body_id)
router.post('/save-contact-body',adminCTRL.save_contact_body)


// ABOUT BODY
router.get('/get-about-body',adminCTRL.get_about_body)
router.get('/get-about-body/:id',adminCTRL.get_about_body_id)
router.post('/save-about-body',adminCTRL.save_about_body)

// ABOUT SLIDER
router.get('/get-about-slider',adminCTRL.get_about_slider)
router.get('/get-about-slider/:id',adminCTRL.get_about_slider_id)
router.post('/add-about-slider',adminCTRL.add_about_slider)
router.post('/save-about-slider',adminCTRL.save_about_slider)
router.post('/delete-about-slider',adminCTRL.delete_about_slider)


// ABOUT MAIN IMAGES
router.get('/get-about-main-images',adminCTRL.get_about_main_images)
router.get('/get-about-main-images/:id',adminCTRL.get_about_main_images_id)
router.post('/save-about-main-images',adminCTRL.save_about_main_images)


// PRODUCTS  header
router.get('/get-products-header',adminCTRL.get_products_header)
router.get('/get-products-header/:id',adminCTRL.get_products_header_id)
router.post('/save-products-header',adminCTRL.save_products_header)



// REPORTS
router.get('/get-reports',adminCTRL.get_reports)
router.get('/get-reports/:id',adminCTRL.get_reports_id)
router.post('/save-reports',adminCTRL.save_reports)


// SERVICES
router.get('/get-services',adminCTRL.get_services)
router.get('/get-services/:id',adminCTRL.get_services_id)
router.post('/add-services',adminCTRL.add_services)
router.post('/save-services',adminCTRL.save_services)
router.post('/delete-services',adminCTRL.delete_services)



// HOME SLIDERS
router.get('/get-home-sliders',adminCTRL.get_home_sliders)
router.get('/get-home-sliders/:id',adminCTRL.get_home_sliders_id)
router.post('/add-home-sliders',adminCTRL.add_home_sliders)
router.post('/save-home-sliders',adminCTRL.save_home_sliders)
router.post('/delete-home-sliders',adminCTRL.delete_home_sliders)




// PRODUCT CATEGORIES
router.get('/get-product-categories',adminCTRL.get_product_categories)
router.get('/get-product-categories/:id',adminCTRL.get_product_categories_id)
router.post('/add-product-categories',adminCTRL.add_product_categories)
router.post('/save-product-categories',adminCTRL.save_product_categories)
router.post('/delete-product-categories',adminCTRL.delete_product_categories)



// PRODUCTS
router.get('/get-products',adminCTRL.get_products)
router.get('/get-products/:id',adminCTRL.get_products_id)
router.post('/add-products',adminCTRL.add_products)
router.post('/save-products',adminCTRL.save_products)
router.post('/delete-products',adminCTRL.delete_products)



// STATISTICA
router.get('/get-statistica',adminCTRL.get_statistica)
router.get('/get-statistica/:id',adminCTRL.get_statistica_id)
router.post('/add-statistica',adminCTRL.add_statistica)
router.post('/save-statistica',adminCTRL.save_statistica)
router.post('/delete-statistica',adminCTRL.delete_statistica)



module.exports=router