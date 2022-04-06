<template>
  <div class="row">
    <div class="col-md-12">
      <div class="company-gallery-index">
        <swiper
          ref="mySwiper"
          :options="swiperPartnersOptions"
          @slideChange="handleSlideChange"
        >
          <swiper-slide v-for="(slider_image, i) in slider_images" :key="i">
            <img
              style="width: 100%; height: 100%; min-height: 1px"
              :src="`${imgURL}${slider_image}`"
            />
          </swiper-slide>
        </swiper>
      </div>
      <div
        class="progress"
        role="progressbar"
        aria-valuemin="0"
        aria-valuemax="100"
      ></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    slider_images: {
      type: Array,
      default: () => [],
    },
    imgURL: {
      type: String,
      default: () => "",
    },
    swiperPartnersOptions: {
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {
      nextSlide: 0,
      illusion: 8,
      imagesLoaded: 28,
    };
  },
  computed: {
    swiper() {
      return this.$refs.mySwiper.$swiper;
    },
  },
  mounted() {
    setTimeout(async () => {
      await this.swiper;
    }, 0);
  },
  methods: {
    handleSlideChange() {
      const $progressBar = document.querySelector(".progress");
      const calc = Math.ceil(
        ((this.nextSlide + 1) /
          (this.swiper.imagesLoaded === 0
            ? this.imagesLoaded
            : this.swiper.imagesLoaded - this.illusion)) *
          100
      );
      $progressBar.style.backgroundSize = `${calc}% 100%`;
      $progressBar.setAttribute("aria-valuenow", calc);
      this.nextSlide++;
      if (this.swiper.imagesLoaded === 0) {
        if (this.nextSlide === 28) {
          this.nextSlide = 0;
        }
      } else {
        if (this.nextSlide === 27) {
          this.nextSlide = 0;
        }
      }
    },
  },
};
</script>

<style scoped>
.row >>> .swiper-wrapper {
  height: 250px;
}
</style>
