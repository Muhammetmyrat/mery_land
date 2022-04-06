<template>
  <ul class="notika-main-menu-dropdown">
    <li v-for="(item2, index2) in item.array" :key="index2">
      <nuxt-link :to="`/admin/${item2.link}`"> {{ item2.title }}</nuxt-link>
    </li>
    <!-- <li><a href="#"> |</a></li> -->
  </ul>
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true,
    },
  },
};
</script>
<style src="@/assets/css/dashboard/style.css" scoped></style>