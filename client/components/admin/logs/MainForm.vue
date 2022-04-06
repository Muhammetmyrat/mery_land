<template>
  <div class="container-login100">
    <div class="wrap-login100">
      <form @submit.prevent class="login100-form validate-form">
        <slot> </slot>
      </form>
    </div>
  </div>
</template>

<script>
export default {};
</script>
