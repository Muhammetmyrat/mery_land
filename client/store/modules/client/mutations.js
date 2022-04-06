const setHeaderDatas = (state, data) => {
  state.headers = data.header
  state.languages = data.languages
  state.services = data.services
  state.settings = data.settings
  state.categories = data.categories
}

const setFooterDatas = (state, data) => {
  state.footer = data.footer
  state.address = data.address
  state.phones = data.phones
}
const setHomeBodyDatas = (state, data) => {
  state.sliders = data.slider
  state.body_texts = data.body_texts
  state.partners = data.partners
  state.home_products = data.home_products
  state.responses = data.response
  state.statistics = data.statistics
}
const setAboutImages = (state, data) => {
  state.about_head_image = data.about_head_image
  state.about_body_image = data.about_body_image
}

const setAboutBodyDatas = (state, data) => {
  state.aboutTitle1 = data.title1
  state.aboutText1 = data.text1
  state.aboutTitle2 = data.title2
  state.aboutText2 = data.text2
  state.aboutButtonText = data.button_text
}

const setAboutBodySliderImages = (state, data) => {
  state.slider_images = data
}

const setContactBodyDatas = (state, data) => {
  state.notifications = data.notifications
  state.contact_body_image = data.contact_body_image
  state.contact_body = data.contact_body
}

const setProductBodyDatas = (state, data) => {
  state.productsHeadImage = data.products_image
  state.productsData = data.data
}

const setProductCategoryBodyDatas = (state, data) => {
  state.productsCategoryHeadImage = data.category_image
  state.productsCategory = data.data
}

const setServicesBodyDatas = (state, data) => {
  state.serviceTitle = data.title
  state.serviceText = data.text
  state.serviceImagePath = data.image_path
}

const setSearchDatas = (state, data) => {
  state.searchDatas = data
}

export default {
  setHeaderDatas,
  setFooterDatas,
  setHomeBodyDatas,
  setAboutImages,
  setAboutBodyDatas,
  setContactBodyDatas,
  setAboutBodySliderImages,
  setProductBodyDatas,
  setProductCategoryBodyDatas,
  setServicesBodyDatas,
  setSearchDatas,
}
