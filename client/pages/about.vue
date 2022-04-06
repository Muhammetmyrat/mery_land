<template>
  <span>
    <section
      class="single-page-header"
      :style="`
        height: 400px;
        backgroundImage: url(${imgURL}${about_head_image})`"
    >
      <div class="container">
        <div class="row">
          <div class="col-md-12"></div>
        </div>
      </div>
    </section>
    <section class="section grallery">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="title text-center pClass">
              <h2>
                <span class="custon-underline">{{ aboutTitle1 }}</span>
              </h2>
              <div style="margin-top: 10px" v-html="aboutText1"></div>
            </div>
          </div>
        </div>
        <PartnersSlider
          :slider_images="slider_images"
          :swiperPartnersOptions="swiperPartnersOptions"
          :imgURL="imgURL"
        />
      </div>
    </section>
    <section
      class="call-to-action section"
      :style="`
        backgroundImage: url(${imgURL}${about_body_image})`"
    >
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center background">
            <h2 class="mini-border">
              {{ aboutTitle2 }}
            </h2>
            <div v-html="aboutText2"></div>
            <button
              @click="$router.push(localePath('/contact'))"
              class="btn btn-main"
            >
              {{ aboutButtonText }}
            </button>
          </div>
        </div>
      </div>
    </section>
  </span>
</template>

<script>
import { mapActions, mapState, mapGetters } from "vuex";
import PartnersSlider from "@/components/PartnersSlider.vue";
export default {
  head() {
    return {
      title: `${this.$t("aboutPageTitle").toUpperCase()} | ${this.$t(
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
  components: { PartnersSlider },
  watch: {
    "$i18n.locale": async function () {
      await this.fetchAboutBodyDatas({
        url: `${this.$i18n.locale}/about`,
        $nuxt: this.$nuxt,
      });
    },
  },
  async fetch() {
    await this.fetchAboutBodyDatas({
      url: `${this.$i18n.locale}/about`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapState("client", [
      "aboutTitle1",
      "aboutText1",
      "aboutTitle2",
      "aboutText2",
      "aboutButtonText",
      "slider_images",
      "swiperPartnersOptions",
      "imgURL",
    ]),
    ...mapGetters("client", ["about_head_image", "about_body_image"]),
  },
  methods: {
    ...mapActions("client", ["fetchAboutBodyDatas"]),
  },
};
</script>
