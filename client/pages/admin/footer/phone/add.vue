<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Text Input------------->
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
        <ContentBlockTextInput
          v-model="title1"
          @updateInput="updateTitle1"
          :placeHolder="'Telefon belgi'"
        />
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
      title1: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroyCreate();
  },

  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchGetOneData",
      "deleteOrCreateOrUpdateOneData",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    updateTitle1(update) {
      this.title1 = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("phone_number", this.title1);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-phones",
          data: Dates,
        });
        console.log("ALL OK");
      });
    },
    destroyCreate() {
      this.$nuxt.$off("create");
    },
  },
};
</script>
