<template>
  <div class="tab-content custom-menu-content">
    <!--Cycle for in Navbar Dropdown-->
    <div
      v-for="(item, index) in names"
      :key="index"
      :id="`${item.href}`"
      class="tab-pane notika-tab-menu-bg animated flipInX"
    >
      <!--Cycle for in Navbar's Dropdown's List-->
      <NavbarDropItem :item="item" />
    </div>
  </div>
</template>

<script>
import NavbarDropItem from "@/components/admin/navbar/NavbarDropItem.vue";
export default {
  components: { NavbarDropItem },
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