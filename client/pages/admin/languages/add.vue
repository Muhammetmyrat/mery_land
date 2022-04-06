<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Dili goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="fullLanguages"
          @updateInput="updateFullLanguages"
          :placeHolder="'Diliň ady'"
        />
        <ContentBlockTextInput
          v-model="shotLanguages"
          @updateInput="updateShotLanguages"
          :placeHolder="' Diliň gysga ady'"
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
      fullLanguages: "",
      shotLanguages: "",
      image: null,
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
      "deleteOrCreateOrUpdateOneData",
      //"newPhotoSelect",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    newsPhotoSelect(photo) {
      this.image = photo;
    },
    updateFullLanguages(update) {
      this.fullLanguages = update;
    },
    updateShotLanguages(update) {
      this.shotLanguages = update;
    },

    async cycleInDates() {
      let formData = new FormData();
      formData.append("name", this.fullLanguages);
      formData.append("short_name", this.shotLanguages);
      formData.append("image", this.image);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-products",
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
