import actions from "./actions"
import mutations from "./mutations"
import getters from "./getters"

const state = () => ({
  imgURL: "http://10.192.1.52:3000/api",
  swiperOptions: {
    autoplay: {
      delay: 7000,
      disableOnInteraction: false,
    },
    loop: true,
    speed: 1500,
    autoplayStopOnLast: false,
    navigation: {
      nextEl: ".prevArrow .slick-arrow",
      prevEl: ".nextArrow .slick-arrow",
    },
	 keyboard: {
		enabled: true,
		onlyInViewport: true,
		pageUpDown: true,
	 },
  },
  slickOptionsPartners: {
    autoplay: {
      delay: 2000,
      disableOnInteraction: false,
    },
    loop: true,
    speed: 800,
    slidesPerView: 5,
    lazyLoading: true,
    autoplayStopOnLast: false,
    breakpoints: {
      1200: {
        slidesPerView: 4,
      },
      1000: {
        slidesPerView: 3,
        spaceBetween: 10,
      },
      450: {
        slidesPerView: 2,
      },
      320: {
        slidesPerView: 1,
      },
    },
  },
  headers: null,
  services: null,
  sliders: null,
  body_texts: null,
  partners: null,
  home_products: null,
  responses: null,
  languages: null,
  footer: null,
  settings: null,
  categories: null,
  address: null,
  phones: null,
  notifications: null,
  contact_body_image: null,
  contact_body: null,
  serviceTitle: null,
  serviceText: null,
  serviceImagePath: null,
  swiperPartnersOptions: {
    autoplay: {
      delay: 1000,
      disableOnInteraction: false,
    },
    loop: true,
    speed: 1500,
    initialSlide: 0,
    freeMode: true,
    slidesPerGroup: 1,
    slidesPerView: 5,
    loopFillGroupWithBlank: true,
    breakpoints: {
      1200: {
        slidesPerView: 4,
      },
      1000: {
        slidesPerView: 3,
        spaceBetween: 10,
      },
      450: {
        slidesPerView: 2,
      },
      320: {
        slidesPerView: 1,
      },
    },
  },
  about_head_image: null,
  about_body_image: null,
  aboutTitle1: null,
  aboutText1: null,
  aboutTitle2: null,
  aboutText2: null,
  aboutButtonText: null,
  slider_images: null,
  statistics: null,
  productsData: null,
  productsHeadImage: null,
  productsCategoryHeadImage:null,
  productsCategory: null,
  searchDatas: null,
})

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
}
