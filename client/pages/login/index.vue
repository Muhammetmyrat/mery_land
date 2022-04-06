<template>
  <div class="limiter">
    <MainForm>
      <FormHeader :title="'Hoş geldiňiz'" />

      <LogInput
        @updateInput="updateInputUser"
        v-model="log.username"
        :type="'text'"
        :dataPlace="'Username'"
      />
      <LogInput
        @updateInput="updateInputPass"
        v-model="log.password"
        :type="'password'"
        :dataPlace="'Password'"
      />
      <LogButtonForm>Giriş</LogButtonForm>
      <LogFooter :link="'forgoten-password'" />
      <!-- <div class="testing">dgtasvdbsan</div> -->
    </MainForm>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
export default {
  layout: "login",
  data() {
    return {
      //  name: "Qweqreqw",
      log: {
        username: "",
        password: "",
      },
    };
  },
  computed: {
    ...mapState("admin", ["isAuthenticated", "getAuthToken"]),
  },
  // created() {
  //   this.login();
  // },
  async mounted() {
    // await this.check();
    await this.login();
  },
  beforeDestroy() {
    this.destroySend();
  },
  // beforeDestroy() {
  //   this.destroySend();
  // },
  methods: {
    ...mapActions("admin", ["AuthenticatorResponse", "fetchAuthToken"]),

    async login() {
      await this.$nuxt.$on("send", async () => {
        try {
          const res = await this.$auth.loginWith("local", {
            data: this.log,
          });
          console.log(res);
          console.log(this.getAuthToken);
          // this.$router.push("/admin/homepage/slider");
          this.fetchAuthToken(res.data.token);
          this.$router.push("/admin/homepage/slider");
        } catch (error) {
          console.log(error);
        } // do something...
      });
    },

    //Destroy Global event
    destroySend() {
      this.$nuxt.$off("send");
    },

    // For Update log.username from component
    updateInputUser(update) {
      this.log.username = update;
    },
    //For Update log.password from component
    updateInputPass(update) {
      this.log.password = update;
    },
  },
};
</script>
