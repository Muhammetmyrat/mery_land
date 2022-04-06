<template>
  <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
    <!--Cycle for in Navbar-->
    <li v-for="(item, index) in names" :key="index">
      <a :href="`#${item.href}`" data-toggle="tab"
        ><i :class="`${item.icon}`"></i> {{ item.title }}</a
      >
    </li>
  </ul>
</template>

<script>
export default {
  props: {
    names: {
      type: Array,
      required: true,
    },
  },
};
</script>
<style src="@/assets/css/dashboard/style.css" scoped>
</style>
