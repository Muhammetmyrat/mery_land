<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle" />
        <ContentBlockTextArea v-model="text1" @updateInput="updateText" />
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
      image: null,
      title1: "",
      text1: "",
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
      //"newPhotoSelect",
    ]),
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitleTR(update) {
      this.title1 = update;
    },
    updateTitleRU(update) {
      this.text2 = update;
    },

    /*-------------------------------*/
    forInDates(some) {
      let Dates = some.data.data[0];
      this.fullLanguages = Dates.name;
      this.shotLanguages = Dates.short_name;
      this.image = Dates.image_path;
      return Dates;
    },
    /*-------------------------------*/

    cycleInDates() {
      let formData = new FormData();
      formData.append("category_id", this.id);
      formData.append("image", this.image);
      formData.append("name", this.title1);
      formData.append("text", this.text1);
      return formData;
    },

    /**--------------------------------------*/
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
