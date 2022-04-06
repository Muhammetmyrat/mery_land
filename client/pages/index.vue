<template>
  <div>
    <HeroSlider
      :sliders="sliders"
      :swiperOptions="swiperOptions"
      :imgURL="imgURL"
    />
    <AboutUs
      :body_text_firts_col="body_text_firts_col"
      :responses="responses"
      :imgURL="imgURL"
    />
    <Blog
      :body_text_firts_col="body_text_firts_col"
      :home_products="home_products"
      :statistics="statistics"
      :partners="partners"
      :slickOptionsPartners="slickOptionsPartners"
      :imgURL="imgURL"
    />
  </div>
</template>

<script>
import { mapActions, mapState, mapGetters } from "vuex";
import HeroSlider from "@/components/HeroSlider.vue";
import AboutUs from "@/components/AboutUs.vue";
import Blog from "@/components/Blog.vue";
export default {
  layout: "default",
  name: "HomePage",
  head() {
    return {
      title: `${this.$t("homePageTitle").toUpperCase()} | ${this.$t(
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
  components: {
    HeroSlider,
    AboutUs,
    Blog,
  },
  watch: {
    "$i18n.locale": async function () {
      await this.fetchHomeBodyDatas({
        url: `${this.$i18n.locale}/home`,
        $nuxt: this.$nuxt,
      });
    },
  },
  async fetch() {
    await this.fetchHomeBodyDatas({
      url: `${this.$i18n.locale}/home`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapState("client", [
      "swiperOptions",
      "slickOptionsPartners",
      "statistics",
    ]),
    ...mapGetters("client", [
      "body_text_firts_col",
      "imgURL",
      "responses",
      "home_products",
      "partners",
      "sliders",
    ]),
  },
  methods: {
    ...mapActions("client", ["fetchHomeBodyDatas"]),
  },
};
</script>
