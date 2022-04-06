<template>
  <section>
    <Header />
    <Nuxt />
    <Footer />
  </section>
</template>

<script>
import "@/static/style.css";
import "@/static/bootstrap.min.css";
import "@/static/themefisher-font/fonts.css";
import "@/static/animate.css";
import Header from "@/components/header/Header.vue";
import Footer from "@/components/footer/Footer.vue";
export default {
  head() {
    return {
      script: [{ src: "/jquery.min.js" }, { src: "/bootstrap.min.js" }],
    };
  },
  components: {
    Header,
    Footer,
  },
};
</script>


<style scoped>
/* @import "@/assets/bootstrap.min.css"; */
</style>
