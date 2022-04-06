<template>
  <NuxtLink :to="localePath('/')" class="navbar-brand logo" href="#">
    <img class="logo-default" :src="`${imageURL}${logoBlack}`" alt="logo" />
    <img
      style="max-width: 160px"
      class="logo-white"
      :src="`${imageURL}${logoWhite}`"
      alt="logo"
    />
    <!-- <img
      class="logo-default"
      src="https://maryland-ltd.com/uploads/logo-black.svg"
      alt="logo"
    />
    <img
      style="max-width: 160px"
      class="logo-white"
      src="https://maryland-ltd.com/uploads/logo.svg"
      alt="logo"
    /> -->
  </NuxtLink>
</template>

<script>
export default {
  props: {
    logoWhite: {
      type: String,
      default: () => "",
    },
    logoBlack: {
      type: String,
      default: () => "",
    },
    imageURL: {
      type: String,
      default: () => "",
    },
  },
};
</script>