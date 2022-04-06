<template>
  <div>
    <HeaderAdmin />
    <Navbar />
    <nuxt />
    <Footer />
  </div>
</template>

<script>
//CSS Styles
// import "@/assets/css/dashboard/style.css";
import "@/assets/css/dashboard/font-awesome.min.css";
import "@/assets/css/dashboard/meanmenu.min.css";
import "@/assets/css/dashboard/style2.css";

//Components
import HeaderAdmin from "@/components/admin/header.vue";
import Navbar from "@/components/admin/navbar/navbar.vue";
import Footer from "@/components/admin/footer.vue";

//Register Global UI components
import "@/components/admin/UI";
//Register Global Content components
import "@/components/admin/content";
import "@/components/admin/add";

export default {
  components: {
    HeaderAdmin,
    Navbar,
    Footer,
  },

  head() {
    return {
      script: [{ src: "/jquery.min.js" }, { src: "/bootstrap.min.js" }],
    };
  },
  middleware: ["auth"],
};
</script>

<style src="@/assets/css/dashboard/style.css" scoped>
body {
  background: #f6f8fa !important;
}
a {
  font-family: "Roboto", sans-serif !important;
  font-weight: 400 !important;
}
.h-vh {
  height: 100vh;
}
ul li {
  margin: 0 !important;
  list-style: none !important;
  margin-left: 0 !important;
  margin-bottom: 0 !important;
}
/* a:hover {
 color: #007bff !important;
} */
</style>
