const imgURL = (state) => {
  return state.imgURL
}
const menu1 = (state) => {
  return state.headers && state.headers.menu1
}
const menu2 = (state) => {
  return state.headers && state.headers.menu2
}
const menu3 = (state) => {
  return state.headers && state.headers.menu3
}
const menu4 = (state) => {
  return state.headers && state.headers.menu4
}
const menu5 = (state) => {
  return state.headers && state.headers.menu5
}
const responses = (state) => {
  return state.responses
}
const services = (state) => state.services

const categories = (state) => {
  return state.categories
}
const languages = (state) => {
	return state.languages
 }
const title1 = (state) => {
  return state.footer && state.footer.title1
}
const title2 = (state) => {
  return state.footer && state.footer.title2
}
const title3 = (state) => {
  return state.footer && state.footer.title3
}
const title4 = (state) => {
  return state.footer && state.footer.title4
}
const title5 = (state) => {
  return state.footer && state.footer.title5
}
const logo = (state) => {
  return state.settings && state.settings.logo
}
const logo_black = (state) => {
  return state.settings && state.settings.logo_black
}
const favicon = (state) => {
  return state.settings && state.settings.favicon
}
const email = (state) => {
  return state.settings && state.settings.email
}
const whatsapp = (state) => {
  return state.settings && state.settings.whatsapp
}
const address = (state) => {
  return state.address && state.address.address
}
const body_text_firts_col = (state) => {
  return state.body_texts && state.body_texts[0]
}
const sliders = (state) => {
  return state.sliders
}
const home_products = (state) => {
  return state.home_products
}
const partners = (state) => {
  return state.partners
}
const phones = (state) => {
  return state.phones
}
const report1 = (state) => {
  return state.notifications && state.notifications.report1
}
const report2 = (state) => {
  return state.notifications && state.notifications.report2
}
const image_path = (state) => {
  return state.contact_body_image && state.contact_body_image.image_path
}
const about_head_image = (state) => {
	return state.about_head_image && state.about_head_image.image_path
}
const about_body_image = (state) => {
	return state.about_body_image && state.about_body_image.image_path
}
const contactTitle1 = (state) => {
  return state.contact_body && state.contact_body.title1
}
const contactText1 = (state) => {
  return state.contact_body && state.contact_body.text1
}
const contactTitle2 = (state) => {
  return state.contact_body && state.contact_body.title2
}
const contact_name = (state) => {
  return state.contact_body && state.contact_body.contact_name
}
const contact_email = (state) => {
  return state.contact_body && state.contact_body.contact_email
}
const contact_subject = (state) => {
  return state.contact_body && state.contact_body.contact_subject
}
const contact_message = (state) => {
  return state.contact_body && state.contact_body.contact_message
}
const contact_button = (state) => {
  return state.contact_body && state.contact_body.contact_button
}

export default {
  imgURL,
  menu1,
  menu2,
  menu3,
  menu4,
  menu5,
  services,
  title1,
  title2,
  title3,
  title4,
  title5,
  responses,
  categories,
  languages,
  logo,
  logo_black,
  favicon,
  email,
  whatsapp,
  address,
  phones,
  body_text_firts_col,
  sliders,
  home_products,
  partners,
  report1,
  report2,
  image_path,
  about_head_image,
  about_body_image,
  contactTitle1,
  contactText1,
  contactTitle2,
  contact_name,
  contact_email,
  contact_subject,
  contact_message,
  contact_button
}
