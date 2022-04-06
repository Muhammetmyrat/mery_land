import tr from "./locales/tr";
import ru from "./locales/ru";
import en from "./locales/en";
export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head() {
    const i18nHead = this.$nuxtI18nHead({ addSeoAttributes: true });
    return {
      titleTemplate: "%s",
      title: "MaryLand",
      htmlAttrs: {
        ...i18nHead.htmlAttrs,
      },
      meta: [
        { charset: "utf-8" },
        {
          name: "google-site-verification",
          content: "EDypr6DLm0eUADq12f7zbocDd90KRHHae4rUyxsYmio",
        },
        { name: "yandex-verification", content: "d78ad6b1e98e2e82" },
        { name: "viewport", content: "width=device-width, initial-scale=1" },
        { name: "format-detection", content: "telephone=no" },
      ],
      link: [
        { rel: "icon", type: "image/x-icon", href: "/images/logo-black.svg" },
      ],
    };
  },
  server: {
    port: 3001,
  },
  // Global CSS: https://go.nuxtjs.dev/config-css
  css: ["swiper/css/swiper.css"],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: [{ src: "@/plugins/vue-awesome-swiper", mode: "client" }],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    "@nuxtjs/i18n",
    "@nuxtjs/axios",
    "@nuxtjs/auth-next",
  ],
  axios: {
    baseURL: "http://10.192.1.52:3000/api",
  },
  auth: {
    redirect: {
      login: "/login/",
      logout: "/login/",
      callback: "/login/",
      home: "/login/",
    },
    strategies: {
      local: {
        scheme: "local",
        token: {
          property: "token",
          type: false,
        },
        user: {
          property: "user",
          // autoFetch: true
        },
        endpoints: {
          login: {
            url: "/login/admin",
            method: "post",
          },
          logout: false,
          user: false,
        },
      },

      local2: {
        scheme: "local",
        token: {
          property: "token",
          type: false,
        },
        // user: {
        //   property: "user",
        //   // autoFetch: true
        // },
        endpoints: {
          login: {
            url: "/login/rescue",
            method: "post",
          },
          logout: false,
          user: false,
        },
      },
    },
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  // axios: {
  //   // Workaround to avoid enforcing hard-coded localhost:3000: https://github.com/nuxt-community/axios-module/issues/308
  //   baseURL: "http://10.192.3.50:8080",
  // },

  i18n: {
    locales: [
      { code: "tr", lang: "TR", name: "Turkey", iso: "tr-TUR", file: "tr" },
      { code: "ru", lang: "RU", name: "Русский", iso: "ru-RU", file: "ru" },
      { code: "en", lang: "EN", name: "English", iso: "en-US", file: "en" },
    ],
    defaultLocale: "tr",
    seo: true,
    vueI18n: {
      fallbackLocale: "tr",
      messages: {
        tr,
        ru,
        en,
      },
    },
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    extractCSS: true,
    // webpack config
  },
};
