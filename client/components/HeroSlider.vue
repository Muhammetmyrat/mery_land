<template>
  <div class="hero-slider">
    <swiper
      ref="mySwiper"
      :options="swiperOptions"
      @slide-change-transition-start="onSwiperSlideChangeTransitionStart"
      @slideChangeTransitionEnd="onSwiperSlideChangeTransitionEnd"
    >
      <button
        @click="swiper.slidePrev()"
        type="button"
        class="prevArrow slick-arrow"
        style="display: block"
        slot="button-prev"
      ></button>
      <swiper-slide
        v-for="(slider, index) in sliders"
        :key="index"
        class="slider-item th-fullpage hero-area"
        :style="`backgroundImage: url(${imgURL}${slider.image_path})`"
      >
        <div class="container">
          <div class="row">
            <div class="col-md-12 text-center response">
              <h1
                style="
                  opacity: 1;
                  animation-delay: 1s;
                  animation-duration: 1.5s;
                "
                class="mini-border"
              >
                {{ slider.title }}
              </h1>
              <div
                style="
                  opacity: 1;
                  animation-delay: 1.5s;
                  animation-duration: 2s;
                  color: white;
                "
                v-html="slider.text"
              ></div>
            </div>
          </div></div></swiper-slide
      ><button
        @click="swiper.slideNext()"
        type="button"
        class="nextArrow slick-arrow"
        style="display: block"
        slot="button-next"
      ></button
    ></swiper>
  </div>
</template>

<script>
import { Swiper, SwiperSlide } from "vue-awesome-swiper";
export default {
  components: {
    Swiper,
    SwiperSlide,
  },
  props: {
    sliders: {
      type: Array,
      default: () => [],
    },
    imgURL: {
      type: String,
      default: () => "",
    },
    swiperOptions: {
      type: Object,
      default: () => {},
    },
  },
  computed: {
    swiper() {
      return this.$refs.mySwiper.$swiper;
    },
  },
  async mounted() {
    await this.swiper;
    await this.addClass();
  },
  methods: {
    addClass() {
      const elemActive = document.querySelector(".swiper-slide-active");
      const elH1Active =
        elemActive &&
        elemActive.children[0] &&
        elemActive.children[0].children[0] &&
        elemActive.children[0].children[0].children[0] &&
        elemActive.children[0].children[0].children[0].children[0]
          ? elemActive.children[0].children[0].children[0].children[0]
          : "";
      const elDivActive =
        elemActive &&
        elemActive.children[0] &&
        elemActive.children[0].children[0] &&
        elemActive.children[0].children[0].children[0] &&
        elemActive.children[0].children[0].children[0].children[1]
          ? elemActive.children[0].children[0].children[0].children[1]
          : "";

      elH1Active &&
        elH1Active.classList &&
        elH1Active.classList.add("fadeInUp");
      elH1Active &&
        elH1Active.classList &&
        elH1Active.classList.add("animated");
      elDivActive &&
        elDivActive.classList &&
        elDivActive.classList.add("fadeInUp");
      elDivActive &&
        elDivActive.classList &&
        elDivActive.classList.add("animated");
    },
    onSwiperSlideChangeTransitionStart() {
      this.addClass();
    },
    onSwiperSlideChangeTransitionEnd() {
      const elemNext = document.querySelector(".swiper-slide-next");
      const elemPrev = document.querySelector(".swiper-slide-prev");
      const elH1Next = elemNext.children[0].children[0].children[0].children[0];
      const elDivNext =
        elemNext.children[0].children[0].children[0].children[1];
      const elH1Prev = elemPrev.children[0].children[0].children[0].children[0];
      const elDivPrev =
        elemPrev.children[0].children[0].children[0].children[1];

      elH1Next.classList.remove("fadeInUp");
      elH1Next.classList.remove("animated");
      elDivNext.classList.remove("fadeInUp");
      elDivNext.classList.remove("animated");
      elH1Prev.classList.remove("fadeInUp");
      elH1Prev.classList.remove("animated");
      elDivPrev.classList.remove("fadeInUp");
      elDivPrev.classList.remove("animated");
    },
  },
};
</script>

<style scoped>
.swiper-slide-active {
  background-size: 150% !important;
}
p {
  color: #fff !important;
}
</style>