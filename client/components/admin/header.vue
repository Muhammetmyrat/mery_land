<template>
  <div>
    <div class="header-top-area bg-dark">
      <div class="header-top-area">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
              <div class="logo-area"></div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
              <div class="header-top-menu">
                <ul class="nav navbar-nav notika-top-nav not-col">
                  <li class="nav-item">
                    <nuxt-link
                      to="/admin/languages"
                      class="nav-link dropdown-toggle pd-lt"
                      title="diller"
                    >
                      <span>
                        <i class="fa fa-language"></i>
                      </span>
                    </nuxt-link>
                  </li>
                  <li class="nav-item">
                    <nuxt-link
                      to="/admin/menu"
                      role="button"
                      class="nav-link dropdown-toggle pd-lt"
                      title="saýtyň menýusy"
                      ><span><i class="fa fa-bars"></i></span
                    ></nuxt-link>
                  </li>
                  <li class="nav-item">
                    <nuxt-link
                      to=""
                      @click.native="$auth.logout()"
                      role="button"
                      class="nav-link dropdown-toggle pd-lt"
                      title="saýtyň menýusy"
                      ><span><i class="fa fa-share-square-o"></i></span
                    ></nuxt-link>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
//import "@/assets/css/dashboard/style.css";

export default {
  head() {
    return {
      //link: [{ rel: "stylesheet", href: "/style.css" }],
    };
  },
};
</script>

<style src="@/assets/css/dashboard/style.css" scoped>
/* .mg-lr {
  margin: 0 15px;
} */
</style>
