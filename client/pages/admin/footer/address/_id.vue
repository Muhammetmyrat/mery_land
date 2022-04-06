<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Text Input------------->
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
        <ContentBlockTextInput v-model="address" @updateInput="updateAddress" />
        <ContentBlockSubmitButton>Goş</ContentBlockSubmitButton>
      </ContentBlockForm>
    </ContentBlock>
  </AddContainer>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",
  data() {
    return {
      address: "",
      lang_name: "",
    };
  },

  beforeDestroy() {
    this.destroyCreate();
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-address/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroyCreate();
  },

  computed: {
    ...mapGetters("admin", ["getGetteredDates"]),

    id() {
      return this.$route.params.id;
    },
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "deleteOrCreateOrUpdateOneData",
      "fetchGetOneData",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    //Treatment dates from State
    forInDates(some) {
      let Dates = some.data.data[0];
      this.address = Dates.address;
      this.lang_name = Dates.lang_name;
      return Dates;
    },

    //Methods get info from Emits

    updateAddress(update) {
      this.address = update;
    },

    //
    cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("address", this.address);
      formData.append("lang_name", this.lang_name);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-address",
          data: Dates,
        });
        console.log("ALL OK");
      });
    },
  },
};
</script>
