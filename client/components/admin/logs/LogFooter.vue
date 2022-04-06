<template>
  <div class="text-center" style="margin-top: 50px">
    <nuxt-link class="txt2" :to="link" style="color: red">
      Parolyňyzy unutdyňyzmy ?
    </nuxt-link>
  </div>
</template>

<script>
export default {
  props: {
    link: {
      required: true,
      type: String,
    },
  },
};
</script>
