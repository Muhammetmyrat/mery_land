<template>
  <span>
    <Statistics
      :statisticsAmount="statistics"
      :body_statistica_title="body_text_firts_col"
      :imgUrl="imgURL"
    />
    <section class="blog" id="blog">
      <div class="container">
        <div class="row">
          <!-- section title -->
          <div class="col-12">
            <div class="title text-center">
              <h2>
                <span class="custon-underline">{{
                  body_text_firts_col && body_text_firts_col.title2
                }}</span>
              </h2>
              <div
                v-html="body_text_firts_col && body_text_firts_col.text2"
              ></div>
              <div class="border"></div>
            </div>
          </div>
          <!-- /section title -->
          <!-- single blog post -->
          <article
            v-for="home_product in home_products"
            :key="home_product.product_id"
            class="col-md-4 col-sm-6 col-xs-12 clearfix"
          >
            <div class="post-item">
              <div class="media-wrapper">
                <img
                  :src="`${imgURL}${home_product.image_path}`"
                  alt="amazing caves coverimage"
                  class="img-fluid"
                />
              </div>

              <div class="content">
                <h3>
                  <a href="#" @click.prevent>{{ home_product.title }}</a>
                </h3>
                <div v-html="home_product.text"></div>
              </div>
            </div>
          </article>
          <!-- /single blog post -->
          <!-- end single blog post -->
        </div>
        <!-- end row -->
        <div class="container-row">
          <div class="row">
            <div class="col-md-12">
              <div class="company-gallery-index">
                <swiper ref="mySwiper" :options="slickOptionsPartners">
                  <swiper-slide v-for="(partner, i) in partners" :key="i">
                    <img
                      style="margin: 0 20px; height: 90px"
                      :src="`${imgURL}${partner.image_path}`"
                      alt="Partner"
                    />
                  </swiper-slide>
                </swiper>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end container -->
    </section></span
  >
</template>

<script>
import { Swiper, SwiperSlide } from "vue-awesome-swiper";
import Statistics from "@/components/Statistics.vue";
export default {
  components: {
    Swiper,
    SwiperSlide,
    Statistics,
  },
  props: {
    body_text_firts_col: {
      type: Object,
      default: () => {},
    },
    home_products: {
      type: Array,
      default: () => [],
    },
    partners: {
      type: Array,
      default: () => [],
    },
    imgURL: {
      typre: String,
      default: () => "",
    },
    slickOptionsPartners: {
      type: Object,
      default: () => {},
    },
    statistics: {
      type: Array,
      default: () => [],
    },
  },
  computed: {
    swiper() {
      return this.$refs.mySwiper.$swiper;
    },
  },
  mounted() {
    this.swiper;
  },
};
</script>

<style scoped>
.company-gallery-index img {
  margin: 0px 30px !important;
  height: 90px !important;
  width: 182px !important;
}
</style>