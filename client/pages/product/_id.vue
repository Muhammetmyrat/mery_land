<template>
  <span>
    <section
      class="single-page-header"
      :style="`height:400px; background-image: url(${imgURL}${
        productsCategoryHeadImage && productsCategoryHeadImage.image_path
      })`"
    >
      <div class="container">
        <div class="row">
          <div class="col-md-12" style="padding-top: 50px">
            <h2>
              {{ getProductTitle && getProductTitle.name }}
            </h2>
          </div>
        </div>
      </div>
    </section>
    <section class="posts section">
      <div class="container">
        <div class="row justify-content-center">
          <article
            class="col-md-4 col-sm-6 col-xs-12 clearfix"
            v-for="(productCategory, i) in productsCategory"
            :key="i"
          >
            <div class="post-item">
              <div class="post-mini-icon">
                <img src="" alt="" />
              </div>
              <div class="media-wrapper">
                <img
                  :src="`${imgURL}${productCategory.image_path}`"
                  alt="amazing caves coverimage"
                  class="img-fluid"
                />
              </div>

              <div class="content">
                <h3>
                  {{ productCategory.title }}
                </h3>
                <span v-html="productCategory.text"></span>
              </div>
            </div>
          </article>
        </div>
        <div class="blog-details-buttons" align="right">
          <div class="blog-details-buttons-container">
            <button
              class="botton_a"
              @click="$router.push(localeLocation('/product'))"
            >
              {{ menu4 }}
            </button>
          </div>
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
      await this.fetchProductCategoryBodyDatas({
        url: `/${this.$i18n.locale}/cat-products/${this.$route.params.id}`,
        $nuxt: this.$nuxt,
      });
    },
  },
  async fetch() {
    await this.fetchProductCategoryBodyDatas({
      url: `/${this.$i18n.locale}/cat-products/${this.$route.params.id}`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapState("client", [
      "productsCategoryHeadImage",
      "productsCategory",
      "imgURL",
    ]),
    ...mapGetters("client", ["menu4", "categories"]),
    getProductTitle() {
      return this.categories.find(
        (category) => category.category_id == this.$route.params.id
      );
    },
  },
  methods: {
    ...mapActions("client", ["fetchProductCategoryBodyDatas"]),
  },
};
</script>

<style scoped>
.blog-details-buttons {
  height: 80px;
  width: 100%;
  display: flex;
  justify-content: right;
}
.blog-details-buttons-container {
  padding: 0 0px;
  height: 100%;
  display: flex;
  align-items: center;
}
.blog-details-buttons-container button {
  height: 40px;
  width: 130px;
  z-index: 9;
  background: #ff0000;
  transition: 0.5s;
  border: none;
}
.blog-details-buttons-container button:hover {
  background: #000;
  z-index: 9;
  transition: 0.5s;
}
.botton_a {
  color: #fff !important;
}
</style>