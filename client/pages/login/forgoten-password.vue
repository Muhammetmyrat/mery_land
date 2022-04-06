<template>
  <div class="limiter">
    <MainForm>
      <FormHeader
        :title="'Parolyňyzy üýtgetmek üçin poçtaňyza mail ugradyň !'"
      />
      <!-- <input
        type="hidden"
        name="_token"
        value="Lz3HxdgKhXvXQsZt3irKfJaES5M5oCw3X6wQsTzn"
      /> -->
      <LogInput
        v-model="data.email"
        @updateInput="updateTitle"
        :type="'email'"
        :dataPlace="'Email'"
      />
      <LogButtonForm>Ugrat</LogButtonForm>
    </MainForm>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "login",
  // middleware: ["login"],
  data() {
    return {
      data: {
        email: "",
      },
      arr: "",
    };
  },

  async mounted() {
    await this.fetchPassToken();
    //await this.addNewElement();
    await this.login();
    this.takeArr;
  },

  beforeDestroy() {
    this.destroySend();
  },

  computed: {
    ...mapGetters("admin", ["getDates"]),
    takeArr() {
      this.arr = this.getDates;
      console.log("ARR", this.arr);
    },
  },

  methods: {
    ...mapActions("admin", [
      "fetchPassToken",
      "deleteOrCreateOrUpdateOneData2",
    ]),

    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    updateTitle(update) {
      this.data.email = update;
    },

    // cycleInDates() {
    //   let formDates = new FormData();
    //   formDates.append("email", this.email);
    //   //formDates.append("partner", this.title);
    //   return formDates;
    // },

    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async login() {
      await this.$nuxt.$on("send", async () => {
        try {
          const res = await this.$auth.loginWith("local2", {
            data: this.data,
          });
          console.log(res);
          console.log(this.getAuthToken);
          // this.$router.push("/admin/homepage/slider");
          // this.fetchAuthToken(res.data.token);
          this.$router.push("/login/change-password");
        } catch (error) {
          console.log(error);
          this.$router.push("/login/");
        } // do something...
      });
    },
    destroySend() {
      this.$nuxt.$off("send");
    },
  },
};
</script>
