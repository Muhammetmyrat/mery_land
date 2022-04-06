<template>
  <form @submit.prevent enctype="multipart/form-data">
    <slot></slot>
  </form>
</template>
<script>
export default {};
</script>
