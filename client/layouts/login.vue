<template>
  <div><nuxt /></div>
</template>
<script>
import "@/assets/css/admin/css/main.css";
import "@/assets/css/admin/css/util.css";
import "@/assets/css/admin/fonts/material-design-iconic-font.min.css";

//Global Register Log components
import "@/components/admin/logs";

export default {
  head() {
    return {
      script: [{ src: "/jquery.min.js" }],
    };
  },
  // middleware: ["checkLogin"],
};
</script>
