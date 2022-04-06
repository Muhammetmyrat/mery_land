<template>
  <section class="blog-details section" style="padding: 170px 0 100px 0">
    <div class="container">
      <div class="row" style="justify-content: center">
        <div class="col-lg-8">
          <article class="post">
            <div class="post-content">
              <div>
                <img
                  class="img-fluid w-50 img_item"
                  style="float: right; margin-left: 15px"
                  :src="`${imgURL}${searchDatas && searchDatas.image_path}`"
                  alt="post-image"
                />
                <h3 style="margin-top: 30px">
                  {{ searchDatas && searchDatas.title }}
                </h3>
                <div v-html="searchDatas && searchDatas.text"></div>
                <div class="blog-details-buttons" align="right">
                  <div class="blog-details-buttons-container">
                    <button>
                      <NuxtLink :to="localePath(`/product`)" class="botton_a">{{
                        menu4
                      }}</NuxtLink>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapActions, mapState, mapGetters } from "vuex";
export default {
  layout: "navigation",
  head() {
    return {
      title: `${this.$t("searchResultPageTitle").toUpperCase()} | ${this.$t(
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
      await this.fetchSearchDatas({
        url: `${this.$i18n.locale}/get_search_product/${this.$route.query.q}`,
        $nuxt: this.$nuxt,
      });
    },
  },
  async fetch() {
    await this.fetchSearchDatas({
      url: `${this.$i18n.locale}/get_search_product/${this.$route.query.q}`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapState("client", ["searchDatas", "imgURL"]),
    ...mapGetters("client", ["menu4"]),
  },
  methods: {
    ...mapActions("client", ["fetchSearchDatas"]),
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
p {
  text-align: justify;
  display: block;
}

@media (min-width: 576px) {
  .w-50 {
    width: 100% !important;
  }
}
@media (max-width: 576px) {
  .w-50 {
    width: 100% !important;
  }
}
@media (min-width: 768px) {
  .w-50 {
    width: 100% !important;
  }
}
@media (min-width: 992px) {
  .w-50 {
    width: 50% !important;
  }
}
@media (min-width: 1200px) {
  .img_item {
    height: 330px;
  }
}
</style>