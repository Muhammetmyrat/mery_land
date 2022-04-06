<template>
  <span>
    <section
      class="single-page-header"
      :style="`height:400px; backgroundImage: url(${imgURL}${
        productsHeadImage && productsHeadImage.image_path
      })`"
    >
      <div class="container">
        <div class="row">
          <div class="col-md-12" style="padding-top: 50px">
            <h2>{{ menu4 }}</h2>
          </div>
        </div>
      </div>
    </section>
    <section class="posts section">
      <div class="container">
        <div class="row justify-content-center">
          <article
            class="col-md-4 col-sm-6 col-xs-12 clearfix"
            v-for="(productData, i) in productsData"
            :key="i"
          >
            <div class="post-item">
              <div class="post-mini-icon">
                <img src="" alt="" />
              </div>
              <div class="media-wrapper">
                <img
                  :src="`${imgURL}${productData.image_path}`"
                  alt="amazing caves coverimage"
                  class="img-fluid"
                />
              </div>

              <div class="content">
                <h3>
                  {{ productData.title }}
                </h3>
                <div v-html="productData.text"></div>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>
  </span>
</template>

<script>
import { mapActions, mapState, mapGetters } from "vuex";
export default {
  head() {
    return {
      title: `${this.$t("productPageTitle").toUpperCase()} | ${this.$t(
        "headTitle"
      )}`,
      meta: [
        {
          hid: "description",
          name: "description",
          content: this.$t("headTitle"),
        },
        {
          name: "keywords",
          content:
            "Maryland, Himiýa, Химия, Himiya, Turkmenistan, Tm, Туркменистан, ТМ",
        },
        {
          name: "author",
          content: "Salam Coding",
        },
      ],
    };
  },
  watch: {
    "$i18n.locale": async function () {
      await this.fetchProductBodyDatas({
        url: `${this.$i18n.locale}/products-all`,
        $nuxt: this.$nuxt,
      });
    },
  },
  async fetch() {
    await this.fetchProductBodyDatas({
      url: `${this.$i18n.locale}/products-all`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapState("client", ["productsHeadImage", "productsData", "imgURL"]),
    ...mapGetters("client", ["menu4"]),
  },
  methods: {
    ...mapActions("client", ["fetchProductBodyDatas"]),
  },
};
</script>