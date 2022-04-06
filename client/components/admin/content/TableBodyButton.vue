<template>
  <button @click="$emit('remove', item)" title="aýyr" class="btn btn-danger">
    <i class="fa fa-trash"></i>
  </button>
</template>

<script>
export default {
  props: {
    item: {
      //type: Image,
      required: true,
    },
  },
};
</script>

<style scoped></style>
