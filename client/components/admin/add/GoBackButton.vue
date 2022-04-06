<template>
  <a @click="$router.go(-1)" style="color: #00c292" class="btn btn-lg"
    ><i class="fa fa-angle-double-left"></i>
    <slot></slot>
  </a>
</template>

<script>
export default {};
</script>
