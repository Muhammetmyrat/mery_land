<template>
  <div class="error-wrapper">
    <div class="error-wrapper__content">
      <img src="/images/warning.svg" alt="" />
      <center v-if="error.statusCode === 404">{{ pageNotFound }}</center>
      <center v-else>{{ otherError }} - {{ error.statusCode }}</center>
      <h1>
        <center>
          <NuxtLink :to="localePath('/')">{{
            $t("homePage").toUpperCase()
          }}</NuxtLink>
        </center>
      </h1>
    </div>
  </div>
</template>

<script>
export default {
  layout: "empty",
  props: {
    error: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      pageNotFound: this.$t("notFound").toUpperCase(),
      otherError: this.$t("anErrorOccurred").toUpperCase(),
    };
  },
  head() {
    const title =
      this.error.statusCode === 404 ? this.pageNotFound : this.otherError;
    return {
      title,
    };
  },
};
</script>

<style scoped>
.error-wrapper {
  height: 100vh;
  overflow: hidden;
}
.error-wrapper__content {
  font-size: 2rem;
  letter-spacing: 0.2rem;
  line-height: 3rem;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  color: red;
  height: 100vh;
}
a {
  font-size: 1.5rem;
  letter-spacing: 0.2rem;
  line-height: 3rem;
  color: blue;
}
a:hover,
a:focus,
a:active {
  color: blue !important;
  border-bottom: 2px solid blue;
}
img {
  width: 400px;
  height: 400px;
}
</style>
