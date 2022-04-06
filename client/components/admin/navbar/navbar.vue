<template>
  <div class="main-menu-area mg-tb-40">
    <div class="container">
      <!--Cycle for in Navbar-->
      <NavbarNav :names="names" />
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <!--Cycle for in Navbar Dropdown-->
          <NavbarDropdown :names="names" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
//import "@/assets/css/dashboard/style.css";
import NavbarNav from "@/components/admin/navbar/NavbarNav.vue";
import NavbarDropdown from "@/components/admin/navbar/NavbarDropdown.vue";
// import { v4 as uuidv4 } from "uuid";
const uniqueId = require("lodash.uniqueid");

export default {
  components: { NavbarNav, NavbarDropdown },
  data() {
    return {
      // id: uuidv4(),
      id: uniqueId(),
      names: [
        //Homepage
        {
          title: " Baş sahypa",
          href: "Homepage",
          icon: "fa fa-home",
          id: uniqueId(),
          array: [
            { title: "Baş sahypanyň slideri", link: "homepage/slider" },
            { title: "Baş sahypanyň tekstleri", link: "homepage/text" },
            { title: " Hyzmatdaşlar", link: "homepage/partners" },
            { title: " Statistika", link: "homepage/statistic" },
          ],
        },
        //About
        {
          title: " Biz barada sahypa ",
          href: "About",
          icon: "fa fa-eject",
          id: uniqueId(),
          array: [
            {
              title: "Biz barada sahypanyň esasy suratlary",
              link: "aboutpage/image",
            },
            { title: "Biz barada sahypadaky slider", link: "aboutpage/slider" },
            {
              title: " Biz barada sahypanyň tekstleri",
              link: "aboutpage/text",
            },
          ],
        },
        //Productpage
        {
          title: " Harytlar sahypa ",
          href: "Productpage",
          icon: "fa fa-shopping-cart",
          id: uniqueId(),
          array: [
            { title: "Kategoriýalar", link: "productpage/categories" },
            { title: "Harytlar", link: "productpage/product" },
            {
              title: " Harytlar sahypasynyň sözleri we suraty",
              link: "productpage/text",
            },
          ],
        },
        //Servicepage
        {
          title: " Harytlar sahypa ",
          href: "Servicepage",
          icon: "fa fa-fa fa-sitemap",
          id: uniqueId(),
          array: [{ title: "Hyzmatlar", link: "servicepage/service" }],
        },
        //Contactpage
        {
          title: " Habarlaşmak sahypa ",
          href: "Contactpage",
          icon: "fa fa-phone",
          id: uniqueId(),
          array: [
            {
              title: "Habarlaşmak sahypanyň teksti we suraty",
              link: "contactpage/text",
            },
          ],
        },
        //Footer
        {
          title: " Beýlekiler ",
          href: "Footer",
          icon: "fa fa-gears",
          id: uniqueId(),
          array: [
            { title: "Footeriň teksti", link: "footer/text" },
            { title: "Firmanyň salgysy ", link: "footer/address" },
            { title: " Saýtyň nastroykasy ", link: "footer/settings" },
            { title: " Telefon belgiler ", link: "footer/phone" },
            { title: " Bildirişler", link: "footer/notification" },
          ],
        },
      ],
    };
  },
};
</script>
