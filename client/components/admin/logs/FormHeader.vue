<template>
  <div>
    <span class="login100-form-title p-b-26"> {{ title }} </span>
    <span class="login100-form-title p-b-48">
      <img
        style="height: 7vw !important"
        src="https://maryland-ltd.com/uploads/logo-black.svg"
        alt=""
      />
    </span>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      required: true,
    },
  },
};
</script>
