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
        v-model="data.mail_pass"
        @updateInput="updateTitle3"
        :type="'password'"
        :dataPlace="'Email Password'"
      />
      <LogInput
        v-model="data.password"
        @updateInput="updateTitle"
        :type="'password'"
        :dataPlace="'Password'"
      />
      <LogInput
        v-model="data.confirm_password"
        @updateInput="updateTitle2"
        :type="'password'"
        :dataPlace="'Confirm Password'"
      />
      <LogButtonForm>Ugrat</LogButtonForm>
    </MainForm>
  </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "login",

  middleware: ["auth"],
  data() {
    return {
      data: {
        mail_pass: "",
        password: "",
        confirm_password: "",
      },
    };
  },

  async mounted() {
    await this.fetchPassToken();
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroySend();
  },

  computed: {
    ...mapGetters("admin", ["getPassToken"]),
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
      this.data.password = update;
    },
    updateTitle2(update) {
      this.data.confirm_password = update;
    },
    updateTitle3(update) {
      this.data.mail_pass = update;
    },

    cycleInDates() {
      let formDates = new FormData();
      if (this.password == this.password) {
        formDates.append("password", this.password);
        formDates.append("confirm_password", this.password);
      }
      //formDates.append("partner", this.title);
      return formDates;
    },

    checkPassword() {
      if (this.data.password == this.data.confirm_password) {
        console.log(this.data);
        return this.data;
      } else {
        console.log("Password Error");
      }
    },

    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("send", async () => {
        //let Dates = await this.cycleInDates();

        try {
          this.deleteOrCreateOrUpdateOneData2({
            url: "rescue/new_pass",
            data: this.checkPassword(),
          });
          console.log(this.getPassToken);
          console.log("ALL OK");
          this.$router.push("/login/");
        } catch (e) {
          console.log("Error Changing Password");
        }
      });
    },
    destroySend() {
      this.$nuxt.$off("send");
    },
  },
  // middleware: ["login"],
};
</script>
