<template>
  <td>
    <img
      style="width: 100px"
      :src="`http://10.192.1.52:3000/api${img.image_path}`"
      alt=""
    />
  </td>
</template>

<script>
export default {
  props: {
    img: {
      //type: Image,
      required: true,
    },
  },
};
</script>

<style scoped>
/* .td-it {
  max-width: 600px !important;
  padding: 0 30px 0px 0px !important;
} */
</style>
