<template>
  <nuxt-link :to="`${link}`" title="üýtget" class="btn btn-primary mrg-rgt"
    ><i class="fa fa-edit"><slot></slot></i>
  </nuxt-link>
</template>
<script>
export default {
  name: "my-link",
  props: {
    link: {
      type: String,
      require: true,
    },
  },
};
</script>

<style scoped>
.mrg-rgt {
  margin-right: 15px;
}
</style>
