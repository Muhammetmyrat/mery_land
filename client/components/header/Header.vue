<template>
  <header class="navigation fixed-top">
    <div class="container">
      <!-- main nav -->
      <HeaderMenu
        :menu1="menu1"
        :menu2="menu2"
        :menu3="menu3"
        :menu4="menu4"
        :menu5="menu5"
        :responses="responses"
        :categories="categories"
        :services="services"
        :logo="logo"
        :logo_black="logo_black"
        :languages="languages"
        :calculateLangImage="calculateLangImage"
        :imgURL="imgURL"
        :calculate="calculate"
        :white="white"
        :black="black"
        :mobileShow="mobileShow"
        @showSearchInputFunc="showSearchInput"
      />
      <HeaderSearchMenu
        :search="search"
        :show="show"
        :searchDatas="searchDatas"
        :hidden="hidden"
        :imgURL="imgURL"
        @fetchSearchDatasForChild="fetchSearchDatas"
        @setHidden="setParentHidden"
      />
      <!-- /main nav -->
    </div>
  </header>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import HeaderMenu from "@/components/header/menu/HeaderMenu.vue";

export default {
  components: {
    HeaderMenu,
  },
  data() {
    return {
      search: "",
      hidden: false,
      show: false,
      timeout: null,
      searchDatas: null,
      white: "#f6f6f6",
      black: "#333333",
      mobileShow: true,
    };
  },
  watch: {
    "$i18n.locale": async function () {
      await this.fetchHeaderDatas({
        url: `${this.$i18n.locale}/get-header`,
        $nuxt: this.$nuxt,
      });
      if (this.search !== "" && this.show == true) {
        this.search = "";
        this.show = false;
      }
    },
    $route: function () {
      if (this.search !== "" && this.show == true) {
        this.search = "";
        this.show = false;
      }
    },
  },
  async fetch() {
    await this.fetchHeaderDatas({
      url: `${this.$i18n.locale}/get-header`,
      $nuxt: this.$nuxt,
    });
  },
  computed: {
    ...mapGetters("client", [
      "menu1",
      "menu2",
      "menu3",
      "menu4",
      "menu5",
      "services",
      "responses",
      "categories",
      "logo",
      "languages",
      "logo_black",
      "imgURL",
    ]),

    calculate() {
      if (this.languages !== null) {
        let locale = this.$i18n.locale;
        return this.languages?.filter((lang) => lang.short_name !== locale);
      }
    },
    calculateLangImage() {
      if (this.languages !== null) {
        let locale = this.$i18n.locale;
        return this.languages?.filter((lang) => lang.short_name === locale);
      }
    },
  },
  mounted() {
    const elem = document.querySelector(".navigation");
    window.addEventListener("scroll", () => {
      if (window.scrollY > 200) {
        elem.classList.add("sticky-header");
        this.mobileShow = false;
      } else {
        elem.classList.remove("sticky-header");
        this.mobileShow = true;
        this.windowWidth();
      }
    });

    this.windowWidth();
    window.addEventListener("resize", () => this.windowWidth());
    //when click outside search close input
    document.addEventListener("click", (event) => {
      const menuSearchClass = document.querySelector(".search_input-svg");
      const isClickInside = menuSearchClass.contains(event.target);
      if (!isClickInside) {
        if (this.show) {
          this.show = false;
          this.search = "";
        }
      }
    });
  },
  methods: {
    ...mapActions("client", ["fetchHeaderDatas"]),
    windowWidth() {
      if (window.innerWidth <= 991) {
        this.mobileShow = false;
      } else {
        this.mobileShow = true;
      }
    },
    showSearchInput() {
      this.show = !this.show;
      if (this.search !== "" || this.searchDatas !== null) {
        this.search = "";
        this.searchDatas = null;
      }
      this.search = "";
    },
    async fetchSearchDatas(val) {
      this.search = val;
      if (this.search !== "") {
        this.hidden = true;
        clearTimeout(this.timeout);
        this.timeout = setTimeout(async () => {
          let locale = this.$i18n.locale;
          try {
            const res = await this.$axios.$post(`/${locale}/search`, {
              data: this.search,
            });
            if (res.msg === true) {
              this.searchDatas = res.data;
            } else {
              if (this.searchDatas !== null) {
                this.searchDatas = null;
              }
            }
          } catch (e) {
            console.log(e);
          }
        }, 500);
      } else {
        clearTimeout(this.timeout);
        this.timeout = setTimeout(() => {
          if (this.searchDatas != []) {
            this.searchDatas = [];
          }
        }, 500);
      }
    },
    setParentHidden() {
      this.hidden = false;
    },
  },
};
</script>
<style scoped>
</style>
