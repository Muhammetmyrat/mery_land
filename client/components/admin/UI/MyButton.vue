<template>
  <div class="basic-tb-hd">
    <h2>{{ title }}</h2>
    <!-- <MyLink :link="link" /> -->
    <nuxt-link
      :to="`${link}`"
      style="background-color: #2e3432"
      class="btn btn-success"
      ><i class="fa fa-plus-square"></i> <slot></slot
    ></nuxt-link>
  </div>
</template>

<script>
export default {
  name: "my-button",
  props: {
    link: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
  },
};
</script>
