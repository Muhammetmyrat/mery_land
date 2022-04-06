<template>
  <section>
    <HeaderNav />
    <Nuxt />
    <Footer />
  </section>
</template>

<script>
import HeaderNav from "@/components/header/HeaderNav.vue";
import Footer from "@/components/footer/Footer.vue";
export default {
  components: {
    HeaderNav,
    Footer,
  },
};
</script>