<template>
  <nav class="navbar navbar-expand-lg navbar-light">
    <!-- logo -->
    <HeaderLogo :logoWhite="logo" :logoBlack="logo_black" :imageURL="imgURL" />
    <!-- /logo -->
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navigation"
      aria-controls="navigation"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navigation">
      <ul class="navbar-nav ml-auto text-center">
        <li class="nav-item">
          <NuxtLink :to="localePath('/')" class="nav-link" exact>{{
            menu1
          }}</NuxtLink>
        </li>
        <li class="nav-item">
          <NuxtLink :to="localePath('/about')" class="nav-link">{{
            menu2
          }}</NuxtLink>
        </li>
        <li class="nav-item dropdown">
          <NuxtLink
            :to="localePath(`/product`)"
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            {{ menu4 }}
          </NuxtLink>
          <div class="dropdown-menu">
            <NuxtLink
              v-for="productSub in categories"
              :key="productSub.id"
              :to="localePath(`/product/${productSub.category_id}`)"
              class="dropdown-item"
              >{{ productSub.name }}</NuxtLink
            >
          </div>
        </li>
        <li class="nav-item dropdown">
          <a
            style="cursor: pointer"
            @click.prevent
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
            :class="{
              'nuxt-link-active':
                $route.fullPath === `/service/${Number($route.params.id)}`,
            }"
          >
            {{ menu5 }}
          </a>
          <div class="dropdown-menu">
            <NuxtLink
              v-for="service in services"
              :key="service.service_id"
              :to="localePath(`/service/${service.service_id}`)"
              class="dropdown-item"
              >{{ service.title }}</NuxtLink
            >
          </div>
        </li>
        <li class="nav-item">
          <NuxtLink :to="localePath('/contact')" class="nav-link">{{
            menu3
          }}</NuxtLink>
        </li>
        <li class="nav-item dropdown">
          <a
            style="cursor: pointer"
            @click.prevent
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            <img
              :src="`${imgURL}${
                calculateLangImage &&
                calculateLangImage[0] &&
                calculateLangImage[0].image_path
              }`"
            />
            {{ $i18n.locale }}
          </a>
          <div class="dropdown-menu">
            <a
              href="#"
              class="dropdown-item"
              v-for="lang in calculate"
              :key="lang.short_name"
              @click.prevent.stop="$i18n.setLocale(lang.short_name)"
            >
              <img :src="`${imgURL}${lang.image_path}`" />{{
                lang.short_name.toUpperCase()
              }}</a
            >
          </div>
        </li>
        <li class="nav-item">
          <div
            class="nav-item_search"
            @click.prevent
            style="margin-top: 17px; margin-left: 5px"
          >
            <svg
              class="search_input-svg"
              @click="showSearch"
              width="17"
              height="17"
              viewBox="0 0 14 14"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M12.5766 13.9986L7.80956 9.2326C5.65338 10.655 2.77057 10.215 1.13689 8.21415C-0.496801 6.2133 -0.351348 3.30073 1.47356 1.4726C3.30137 -0.353006 6.21426 -0.49909 8.21555 1.13449C10.2168 2.76806 10.6571 5.6512 9.23456 7.8076L13.9996 12.5756L12.5766 13.9986ZM5.03356 2.01259C3.59281 2.01168 2.35204 3.02862 2.07004 4.4415C1.78805 5.85439 2.54337 7.26972 3.87408 7.82195C5.2048 8.37418 6.7403 7.90951 7.54154 6.71211C8.34279 5.51471 8.18662 3.91806 7.16856 2.8986C6.60381 2.32994 5.835 2.0109 5.03356 2.01259Z"
                :fill="mobileShow ? white : black"
              />
            </svg>
          </div>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
import HeaderLogo from "@/components/header/HeaderLogo.vue";
import HeaderSearchMenu from "./HeaderSearchMenu.vue";
export default {
  component: { HeaderLogo, HeaderSearchMenu },
  props: {
    menu1: {
      type: String,
      default: () => "",
    },
    menu2: {
      type: String,
      default: () => "",
    },
    menu3: {
      type: String,
      default: () => "",
    },
    menu4: {
      type: String,
      default: () => "",
    },
    menu5: {
      type: String,
      default: () => "",
    },
    responses: {
      type: Array,
      default: () => [],
    },
    services: {
      type: Array,
      default: () => [],
    },
    categories: {
      type: Array,
      default: () => [],
    },
    logo: {
      type: String,
      default: () => "",
    },
    logo_black: {
      type: String,
      default: () => "",
    },
    imgURL: {
      type: String,
      default: () => "",
    },
    calculate: {
      type: Array,
      default: () => [],
    },
    calculateLangImage: {
      type: Array,
      default: () => [],
    },
    white: {
      type: String,
      default: () => "",
    },
    black: {
      type: String,
      default: () => "",
    },
    mobileShow: {
      type: Boolean,
      default: true,
    },
  },
  methods: {
    showSearch() {
      this.$emit("showSearchInputFunc");
    },
  },
};
</script>

<style scoped>
.nuxt-link-active {
  color: #ff0000 !important;
}
.search_input-svg {
  margin-top: 5px;
  cursor: pointer;
}
@media (max-width: 991px) {
  .search_input-svg {
    margin-top: 0;
  }
  .nav-item_search {
    padding-right: 565px;
  }
}
@media (max-width: 767px) {
  .nav-item_search {
    padding-left: 35px;
  }
}
</style>