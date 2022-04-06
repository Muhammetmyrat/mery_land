<template>
  <button @click="$nuxt.$emit('send')" class="login100-form-btn">
    <slot></slot>
  </button>
</template>

<script>
export default {};
</script>
